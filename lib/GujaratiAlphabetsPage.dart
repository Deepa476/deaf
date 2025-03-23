import 'package:flutter/material.dart';
import 'LearnAlphabetPage.dart'; // Import the LearnAlphabetPage

class GujaratiAlphabetsPage extends StatelessWidget {
  final List<String> gujaratiLetters = [
    'અ', 'આ', 'ઇ', 'ઈ', 'ઉ', 'ઊ', 'ઋ', 'ૠ', 'ઌ', 'ૡ', 'એ', 'ઐ', 'ઓ', 'ઑ', 'અં', 'અઃ' , 'ક', 'ખ', 'ગ', 'ઘ', 'ચ', 'છ', 'જ', 'ઝ', 'ટ', 'ઠ', 'ડ', 'ઢ', 'ણ', 'ત', 'થ', 'દ', 'ધ', 'ન', 'પ', 'ફ',
    'બ', 'ભ', 'મ', 'ય', 'ર', 'લ', 'વ', 'શ', 'ષ', 'સ', 'હ', 'ળ', 'ક્ષ', 'જ્ઞ'
  ];

  final List<String> signLanguageImages = List.generate(50, (index) => 'https://via.placeholder.com/150');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gujarati Alphabets',
          style: TextStyle(color: Colors.lightBlue),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 cards per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: gujaratiLetters.length, // Total number of letters
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to LearnAlphabetPage with the selected letter and its sign language image
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LearnAlphabetPage(
                      gujaratiLetters: gujaratiLetters,
                      signLanguageImages: signLanguageImages,
                      currentIndex: index,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    gujaratiLetters[index], // Display the Gujarati letter
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}
