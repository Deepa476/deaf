import 'package:flutter/material.dart';

class LearnAlphabetPage extends StatelessWidget {
  final List<String> gujaratiLetters;
  final List<String> signLanguageImages;
  final int currentIndex; // Index of the currently selected letter

  LearnAlphabetPage({
    required this.gujaratiLetters,
    required this.signLanguageImages,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    String gujaratiLetter = gujaratiLetters[currentIndex];
    String signLanguageImageUrl = signLanguageImages[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn / શીખો', // Heading in English and Gujarati
          style: TextStyle(color: Colors.lightBlue),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.lightBlue), // Back arrow
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.lightBlue), // Three dots icon
            onPressed: () {
              // Optional: Add functionality for more actions here
            },
          ),
        ],
        backgroundColor: Colors.white, // White background for AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top Card for the Gujarati Letter
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    gujaratiLetter, // Display the pressed letter
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Space between cards
            // Middle Row with Left and Right Arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left, size: 40, color: Colors.white),
                  onPressed: currentIndex > 0
                      ? () {
                          // Navigate to the previous letter
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LearnAlphabetPage(
                                gujaratiLetters: gujaratiLetters,
                                signLanguageImages: signLanguageImages,
                                currentIndex: currentIndex - 1, // Previous letter
                              ),
                            ),
                          );
                        }
                      : null, // Disable if it's the first letter
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right, size: 40, color: Colors.white),
                  onPressed: currentIndex < gujaratiLetters.length - 1
                      ? () {
                          // Navigate to the next letter
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LearnAlphabetPage(
                                gujaratiLetters: gujaratiLetters,
                                signLanguageImages: signLanguageImages,
                                currentIndex: currentIndex + 1, // Next letter
                              ),
                            ),
                          );
                        }
                      : null, // Disable if it's the last letter
                ),
              ],
            ),
            const SizedBox(height: 40), // Space between arrows and bottom card
            // Bottom Card for the Sign Language Image
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Sign Language',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Display the corresponding sign language image
                    Image.network(
                      signLanguageImageUrl,
                      height: 200, // Adjust as needed
                      fit: BoxFit.contain,
                    ),
                  ],
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
