import 'package:deaf/GujaratiAlphabetsPage.dart';
import 'package:deaf/screens/learning_modules_page.dart';
import 'package:flutter/material.dart';

class AlphabetsPage extends StatelessWidget {
  const AlphabetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Uses Colors.blue from theme
      body: SafeArea(
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
                    Text(
                      'Learn Alphabets',
                      style: theme.textTheme.headlineLarge, // White, bold, 32pt from theme
                    ),
                    const SizedBox(height: 40),
                    AlphabetCard(
                      title: 'Gujarati Alphabets',
                      subtitle: 'ક ખ ગ ઘ',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GujaratiAlphabetsPage()),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AlphabetCard(
                      title: 'English Alphabets',
                      subtitle: 'A B C D',
                      onTap: () {
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
    );
  }
}

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
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Matches LoginScreen container
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, // Matches LoginScreen shadow
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0), // Matches LoginScreen inner padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor, // Uses Colors.blue from theme
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