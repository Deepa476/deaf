import 'package:deaf/ConverPage.dart';
import 'package:flutter/material.dart';
import 'learning_modules_page.dart'; // Import the Learning Modules Page

class ChooseActionPage extends StatelessWidget {
  const ChooseActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800], // Darker blue for depth
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'What would you like to do?',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                _buildActionButton(
                  context: context,
                  title: 'Learn',
                  subtitle: 'Alphabet, Words, Science, Maths',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LearningModulesPage()),
                    );
                  },
                ),
                const SizedBox(height: 30),
                _buildActionButton(
                  context: context,
                  title: 'Convert',
                  subtitle: 'Sign Language to Text & Vice Versa',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConvertPage()),
                    );
                  },
                ),
                const Spacer(),
                const Text(
                  'Sign Language - English - Gujarati',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 8, // Adds shadow for a floating effect
        shadowColor: Colors.black26,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              color: Colors.blue[800], // Darker blue for contrast
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}