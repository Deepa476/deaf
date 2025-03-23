import 'package:deaf/GujaratiAlphabetsPage.dart';
import 'package:deaf/screens/learning_modules_page.dart';
import 'package:flutter/material.dart';


class AlphabetsPage extends StatelessWidget {
  const AlphabetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlueAccent, Colors.blue],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                onBackPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Learn Alphabets',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      AlphabetCard(
                        title: 'Gujarati Alphabets',
                        subtitle: 'ક ખ ગ ઘ',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  GujaratiAlphabetsPage()),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AlphabetCard(
                        title: 'English Alphabets',
                        subtitle: 'A B C D',
                        onTap: () {
                          // Add functionality for English Alphabets here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('English Alphabets coming soon!')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable AlphabetCard widget (can be moved to common_widgets.dart if needed elsewhere)
class AlphabetCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const AlphabetCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}