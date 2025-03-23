import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deaf/ProfilePage.dart'; // Ensure this import is correct
import 'package:deaf/TestPage.dart'; // Ensure this import is correct

class ProgressTracking extends StatefulWidget {
  const ProgressTracking({super.key});

  @override
  State<ProgressTracking> createState() => _ProgressTrackingState();
}

class _ProgressTrackingState extends State<ProgressTracking> {
  List<bool> completedTests = List.generate(10, (index) => false);
  double progress = 0.0;
  User? user;

  @override
  void initState() {
    super.initState();
    _initializeUserAndLoadProgress();
  }

  Future<void> _initializeUserAndLoadProgress() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _loadProgress();
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> _loadProgress() async {
    if (user == null) return;

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      if (doc.exists) {
        List<dynamic>? tests = doc['completedTests'] as List<dynamic>?;
        if (tests != null) {
          setState(() {
            completedTests = List<bool>.from(tests);
            progress = (completedTests.where((test) => test).length / completedTests.length);
          });
        } else {
          // Initialize completedTests in Firestore if it doesn’t exist
          await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(
            {
              'completedTests': completedTests,
              'progress': progress,
            },
            SetOptions(merge: true),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading progress: $e')),
        );
      }
    }
  }

  Future<void> _updateProgress(int index) async {
    if (user == null || completedTests[index]) return;

    try {
      setState(() {
        completedTests[index] = true;
        progress = (completedTests.where((test) => test).length / completedTests.length);
      });

      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(
        {
          'completedTests': completedTests,
          'progress': progress,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating progress: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        title: const Text(
          'Assignments',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: Radio<bool>(
                  value: true,
                  groupValue: completedTests[index],
                  onChanged: null, // Disabled to show status only
                  activeColor: Colors.blue,
                ),
                title: Text(
                  'Test ${index + 1}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                onTap: () async {
                  if (!completedTests[index]) {
                    bool? completed = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestPage(
                          testNumber: index + 1,
                          onTestCompleted: () => _updateProgress(index),
                        ),
                      ),
                    );

                    if (completed == true) {
                      await _updateProgress(index);
                    }
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}