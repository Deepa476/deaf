import 'dart:io' if (dart.library.html) 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/profile',
      routes: {
        '/profile': (context) => const ProfilePage(),
        // Add your '/login' and '/choose' routes here as needed
      },
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double _progress = 0.0;
  String? _profileImageUrl;
  late final TextEditingController _nameController;
  String _email = "Loading...";
  String _uid = "Loading...";
  firebase_auth.User? _currentUser;
  bool _isLoading = true;
  bool _isEditingName = false;
  bool _isUserNameNull = false;

  final _auth = firebase_auth.FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _supabase = Supabase.instance.client;
  final _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _initializeUser();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _initializeUser() async {
    try {
      _currentUser = _auth.currentUser;
      if (_currentUser != null) {
        await _loadProfileData();
      } else {
        _redirectToLogin();
      }
    } catch (e) {
      _handleError('Initialization error: $e');
    }
  }

  Future<void> _loadProfileData() async {
    if (_currentUser == null) return;

    try {
      setState(() {
        _email = _currentUser!.email ?? "No email available";
        _uid = _currentUser!.uid;
      });

      final doc = await _firestore.collection('users').doc(_currentUser!.uid).get();
      
      if (doc.exists) {
        _updateProfileState(doc);
      } else {
        await _createInitialUserDoc();
      }
    } catch (e) {
      _handleError('Error loading profile: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _saveProfileImage(XFile? image) async {
    if (_currentUser == null || image == null) return;

    try {
      setState(() => _isLoading = true);

      final Uint8List fileBytes = await image.readAsBytes();
      if (fileBytes.isEmpty) throw Exception('Empty image file');

      String category = 'profile/${_currentUser!.uid}';
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      String filePath = '$category/$fileName';

      await _supabase.storage.from('profile').uploadBinary(
        filePath,
        fileBytes,
        fileOptions: FileOptions(contentType: 'image/jpeg'),
      );

      final downloadUrl = _supabase.storage.from('profile').getPublicUrl(filePath);

      await _firestore.collection('users').doc(_currentUser!.uid).update({
        'profileImageUrl': downloadUrl,
      });

      if (mounted) setState(() => _profileImageUrl = downloadUrl);
    } catch (e) {
      debugPrint('Error uploading file: $e');
      _handleError('Error saving image: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _saveUserName() async {
    if (_currentUser == null || _nameController.text.trim().isEmpty) return;

    try {
      setState(() => _isLoading = true);
      await _firestore.collection('users').doc(_currentUser!.uid).update({
        'userName': _nameController.text.trim(),
      });
      if (mounted) {
        setState(() {
          _isEditingName = false;
          _isUserNameNull = false;
        });
      }
    } catch (e) {
      _handleError('Error saving name: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile != null && mounted) {
        await _saveProfileImage(pickedFile);
      }
    } catch (e) {
      _handleError('Error picking image: $e');
    }
  }

  void _updateProfileState(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    if (mounted) {
      setState(() {
        _progress = (data['progress'] ?? 0.0).toDouble();
        _profileImageUrl = data['profileImageUrl'] as String?;
        _isUserNameNull = data['userName'] == null;
        _nameController.text = data['userName'] ?? "";
      });
    }
  }

  Future<void> _createInitialUserDoc() async {
    await _firestore.collection('users').doc(_currentUser!.uid).set({
      'progress': 0.0,
      'completedTests': List.generate(10, (_) => false),
    }, SetOptions(merge: true));
    
    if (mounted) {
      setState(() {
        _progress = 0.0;
        _nameController.text = "";
        _isUserNameNull = true;
      });
    }
  }

  void _handleError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  void _redirectToLogin() {
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Take Photo"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from Gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return _buildLoginPrompt();
    }

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadProfileData,
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await _auth.signOut();
              _redirectToLogin();
            },
            tooltip: 'Sign Out',
          ),
        ],
      ),
      body: _buildProfileBody(),
    );
  }

  Widget _buildLoginPrompt() => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please log in to view your profile'),
          ElevatedButton(
            onPressed: _redirectToLogin,
            child: const Text('Go to Login'),
          ),
        ],
      ),
    ),
  );

  Widget _buildProfileBody() => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        _buildProfileImage(),
        const SizedBox(height: 15),
        _buildNameSection(),
        Text(_email, style: const TextStyle(fontSize: 18, color: Colors.white70)),
        const SizedBox(height: 20),
        _buildProgressIndicator(),
        const SizedBox(height: 20),
        Text('${(_progress * 100).toInt()}% Completed',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 30),
        _buildActionButtons(),
      ],
    ),
  );

  Widget _buildProfileImage() => GestureDetector(
    onTap: _showImagePickerOptions,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            image: DecorationImage(
              image: _profileImageUrl?.isNotEmpty == true
                  ? NetworkImage(_profileImageUrl!)
                  : const AssetImage("assets/default_profile.png") as ImageProvider,
              fit: BoxFit.cover,
              onError: (_, __) => debugPrint("Error loading image"),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 12,
            child: Icon(Icons.camera_alt, color: Colors.blue, size: 24),
          ),
        ),
      ],
    ),
  );

  Widget _buildNameSection() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _isUserNameNull || _isEditingName
              ? TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Name",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  onSubmitted: (_) => _saveUserName(),
                )
              : Text(
                  _nameController.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
        ),
        if (!_isUserNameNull)
          IconButton(
            icon: Icon(_isEditingName ? Icons.save : Icons.edit, color: Colors.white),
            onPressed: () => _isEditingName ? _saveUserName() : setState(() => _isEditingName = true),
          ),
      ],
    ),
  );

  Widget _buildProgressIndicator() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: SizedBox(
      height: 30,
      child: Stack(
        children: [
          // Background of the progress bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          // Animated progress bar with gradient
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: MediaQuery.of(context).size.width * _progress * 0.8, // 80% of padded width
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          // Percentage text overlay
          Center(
            child: Text(
              '${(_progress * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.black54,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildActionButtons() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        _buildButton(
          text: 'Go to Actions',
          color: Colors.white,
          textColor: Colors.blue,
          onPressed: () => Navigator.pushNamed(context, '/choose').then((_) => _loadProfileData()),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );

  Widget _buildButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) => SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
      ),
    ),
  );
}