import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'LearnAlphabetPage.dart'; // Import the LearnAlphabetPage

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> signLanguageImages = List.generate(10, (index) => ''); // Initialize with empty strings
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchSignLanguageImages();
  }

  Future<void> fetchSignLanguageImages() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Initialize Firebase Firestore
      final firestore = FirebaseFirestore.instance;

      // Fetch images from Firestore under learning_modules/number_sign/number_sign
      final collectionRef = firestore
          .collection('learning_modules')
          .doc('number_sign')
          .collection('number_sign');

      // Map numbers to their corresponding image file names
      final Map<String, String> numberToFileName = {
        '0': 'zero_sign.jpg',
        '1': 'one_sign.jpg',
        '2': 'two_sign.jpg',
        '3': 'three_sign.jpg',
        '4': 'four_sign.jpg',
        '5': 'five_sign.jpg',
        '6': 'six_sign.jpg',
        '7': 'seven_sign.jpg',
        '8': 'eight_sign.jpg',
        '9': 'nine_sign.jpg',
      };

      // Fetch all documents in the number_sign collection
      final snapshot = await collectionRef.get();

      // Create a list to store the image URLs in the correct order (0-9)
      List<String> imageUrls = List.generate(10, (index) => '');

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final imageUrl = data['url'] as String?;
        final fileName = doc.id;

        if (imageUrl != null) {
          // Find the corresponding number for this file
          final number = numberToFileName.entries
              .firstWhere((entry) => entry.value == fileName, orElse: () => const MapEntry('', ''))
              .key;

          if (number.isNotEmpty) {
            final index = numbers.indexOf(number);
            if (index != -1) {
              imageUrls[index] = imageUrl;
            }
          }
        }
      }

      setState(() {
        signLanguageImages = imageUrls;
        isLoading = false;
      });

    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
      print('Error fetching sign language images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Numbers',
          style: TextStyle(color: Colors.lightBlue),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.lightBlue),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text('Error: $errorMessage'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 4 cards per row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0, // Ensure square cards
                    ),
                    itemCount: numbers.length, // Total number of numbers (0-9)
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to LearnAlphabetPage with the selected number and its sign language image
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LearnAlphabetPage(
                                gujaratiLetters: numbers, // Using numbers here
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
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                numbers[index], // Display the number
                                style: const TextStyle(
                                  fontSize: 32, // Increased font size for better visibility
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue,
                                ),
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