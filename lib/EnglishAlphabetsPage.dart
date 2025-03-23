import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'LearnAlphabetPage.dart';

class EnglishAlphabetsPage extends StatefulWidget {
  const EnglishAlphabetsPage({super.key});

  @override
  State<EnglishAlphabetsPage> createState() => _EnglishAlphabetsPageState();
}

class _EnglishAlphabetsPageState extends State<EnglishAlphabetsPage> {
  static const List<String> englishLetters = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ];

  late List<String> signLanguageImages;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    signLanguageImages = List.filled(26, '');
    fetchSignLanguageImages();
  }

  Future<void> fetchSignLanguageImages() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final collectionRef = FirebaseFirestore.instance
          .collection('learning_modules')
          .doc('Alphabets')
          .collection('Alphabets')
          .doc('English')
          .collection('English');

      final letterToFileName = {
        'A': 'a_sign.jpg',
        'B': 'b_sign.jpg',
        'C': 'c_sign.jpg',
        'D': 'd_sign.jpg',
        'E': 'e_sign.jpg',
        'F': 'f_sign.jpg',
        'G': 'g_sign.jpg',
        'H': 'h_sign.jpg',
        'I': 'i_sign.jpg',
        'J': 'j_sign.jpg',
        'K': 'k_sign.jpg',
        'L': 'l_sign.jpg',
        'M': 'm_sign.jpg',
        'N': 'n_sign.jpg',
        'O': 'o_sign.jpg',
        'P': 'p_sign.jpg',
        'Q': 'q_sign.jpg',
        'R': 'r_sign.jpg',
        'S': 's_sign.jpg',
        'T': 't_sign.jpg',
        'U': 'u_sign.jpg',
        'V': 'v_sign.jpg',
        'W': 'w_sign.jpg',
        'X': 'x_sign.jpg',
        'Y': 'y_sign.jpg',
        'Z': 'z_sign.jpg',
      };

      final snapshot = await collectionRef.get();
      final imageUrls = List.filled(26, '');

      for (var doc in snapshot.docs) {
        final imageUrl = doc.data()['url'] as String?;
        final fileName = doc.id;

        if (imageUrl != null) {
          final letter = letterToFileName.entries
              .firstWhere(
                (entry) => entry.value == fileName,
                orElse: () => const MapEntry('', ''),
              )
              .key;

          final index = englishLetters.indexOf(letter);
          if (index != -1) {
            imageUrls[index] = imageUrl;
          }
        }
      }

      setState(() {
        signLanguageImages = imageUrls;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load alphabet signs: ${e.toString()}';
        isLoading = false;
      });
      debugPrint('Error fetching sign language images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'English Alphabets',
          style: TextStyle(color: Colors.lightBlue),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.lightBlue),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: $errorMessage'),
                        TextButton(
                          onPressed: fetchSignLanguageImages,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: englishLetters.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LearnAlphabetPage(
                                    gujaratiLetters: englishLetters,
                                    signLanguageImages: signLanguageImages,
                                    currentIndex: index,
                                  ),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Center(
                              child: Text(
                                englishLetters[index],
                                style: const TextStyle(
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
      ),
    );
  }
}