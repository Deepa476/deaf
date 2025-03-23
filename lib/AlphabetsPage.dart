import 'package:flutter/material.dart';
import 'GujaratiAlphabetsPage.dart'; // Import the Gujarati Alphabets Page

class AlphabetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabets', style: TextStyle(color: Colors.lightBlue)), // Page title
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.lightBlue), // Back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        backgroundColor: Colors.white, // White background for AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Learn Alphabets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue, // Fix text color to match background
              ),
            ),
            const SizedBox(height: 40),
            // Box for Gujarati Alphabets
            GestureDetector(
              onTap: () {
                // Navigate to Gujarati Alphabets Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GujaratiAlphabetsPage()),
                );
              },
              child: Card(
                color: Colors.white, // White box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Gujarati Alphabets\n(ક ખ ગ ઘ)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue, // Light blue text
                      ),
                      textAlign: TextAlign.center, // Text center alignment
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Box for English Alphabets (optional)
            GestureDetector(
              onTap: () {
                // Add functionality for English Alphabets here
              },
              child: Card(
                color: Colors.white, // White box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'English Alphabets\n(A B C D)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue, // Light blue text
                      ),
                      textAlign: TextAlign.center, // Text center alignment
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue, // Light blue background color
    );
  }
}
