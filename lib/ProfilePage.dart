import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double progress = 0.0;
  String? profileImageUrl;
  final TextEditingController nameController = TextEditingController();
  String email = "Loading...";
  String uid = "Loading...";
  User? user;
  bool isLoading = true;
  bool isEditingName = false; // Track if the username is being edited
  bool isUserNameNull = false; // Track if username is null in Firestore

  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _loadProfileData();
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> _loadProfileData() async {
    if (user == null) return;

    try {
      setState(() {
        email = user!.email ?? "No email available";
        uid = user!.uid;
      });

      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      if (doc.exists) {
        String? dbUserName = doc['userName'] as String?;
        setState(() {
          progress = (doc['progress'] ?? 0.0).toDouble();
          profileImageUrl = doc['profileImageUrl'];
          isUserNameNull = dbUserName == null; // Check if username is null
          nameController.text = dbUserName ?? ""; // Set to empty if null
          isLoading = false;
        });

        // If username is null, we'll let the user enter it via TextField
        // No need to set a default here; we'll handle it in the UI
      } else {
        // Initialize default data if document doesn’t exist
        await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
          'progress': 0.0,
          'completedTests': List.generate(10, (_) => false),
          // Leave userName null initially
        }, SetOptions(merge: true));
        setState(() {
          progress = 0.0;
          nameController.text = "";
          isUserNameNull = true; // No username yet
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading profile: $e')),
        );
        setState(() {
          email = "Error loading email";
          uid = "Error loading UID";
          isLoading = false;
        });
      }
    }
  }

  Future<void> _saveProfileImage(File image) async {
    if (user == null) return;

    try {
      String filePath = 'profile_images/${user!.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      UploadTask uploadTask = FirebaseStorage.instance.ref(filePath).putFile(image);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(
        {'profileImageUrl': downloadUrl},
        SetOptions(merge: true),
      );

      if (mounted) {
        setState(() {
          profileImageUrl = downloadUrl;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving image: $e')),
        );
      }
    }
  }

  Future<void> _saveUserName() async {
    if (user == null || nameController.text.isEmpty) return;

    try {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(
        {'userName': nameController.text},
        SetOptions(merge: true),
      );
      setState(() {
        isEditingName = false; // Exit edit mode
        isUserNameNull = false; // Username is no longer null
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving name: $e')),
        );
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null && mounted) {
        File imageFile = File(pickedFile.path);
        await _saveProfileImage(imageFile);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
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
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      email = args['email'] ?? email;
      uid = args['uid'] ?? uid;
    }

    if (user == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please log in to view your profile'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Go to Login'),
              ),
            ],
          ),
        ),
      );
    }

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadProfileData,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
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
                        image: profileImageUrl != null && profileImageUrl!.isNotEmpty
                            ? NetworkImage(profileImageUrl!)
                            : const AssetImage("assets/default_profile.png") as ImageProvider,
                        fit: BoxFit.cover,
                        onError: (error, stackTrace) {
                          debugPrint("Error loading image: $error");
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.blue, size: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       isUserNameNull || isEditingName
            //           ? Expanded(
            //               child: TextField(
            //                 controller: nameController,
            //                 textAlign: TextAlign.center,
            //                 style: const TextStyle(
            //                   fontSize: 22,
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.white,
            //                 ),
            //                 decoration: const InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: "Enter Name",
            //                   hintStyle: TextStyle(color: Colors.white70),
            //                 ),
            //                 onSubmitted: (value) => _saveUserName(),
            //               ),
            //             )
            //           : Text(
            //               nameController.text,
            //               style: const TextStyle(
            //                 fontSize: 22,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //             ),
            //       if (!isUserNameNull) // Show edit/save button only if username exists
            //         Row(
            //           children: [
            //             const SizedBox(width: 10),
            //             IconButton(
            //               icon: Icon(
            //                 isEditingName ? Icons.save : Icons.edit,
            //                 color: Colors.white,
            //               ),
            //               onPressed: () {
            //                 if (isEditingName) {
            //                   _saveUserName();
            //                 } else {
            //                   setState(() {
            //                     isEditingName = true;
            //                   });
            //                 }
            //               },
            //             ),
            //           ],
            //         ),
            //     ],
            //   ),
            // ),
            Text(
              email,
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 15,
                backgroundColor: Colors.white,
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${(progress * 100).toInt()}% Completed',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose').then((_) {
                      _loadProfileData();
                    });
                  },
                  child: const Text(
                    'Go to Actions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    if (mounted) {
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}