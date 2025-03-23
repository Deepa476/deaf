import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Add this for image caching

class LearnAlphabetPage extends StatefulWidget {
  final List<String> gujaratiLetters; // List of letters or numbers (e.g., A-Z or 0-9)
  final List<String> signLanguageImages; // List of image URLs
  final int currentIndex; // Current index in the list

  const LearnAlphabetPage({
    super.key,
    required this.gujaratiLetters,
    required this.signLanguageImages,
    required this.currentIndex,
  });

  @override
  State<LearnAlphabetPage> createState() => _LearnAlphabetPageState();
}

class _LearnAlphabetPageState extends State<LearnAlphabetPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void _previousItem() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  void _nextItem() {
    setState(() {
      if (currentIndex < widget.gujaratiLetters.length - 1) {
        currentIndex++;
      }
    });
  }

  void _handleSwipe(DragEndDetails details) {
    // Determine the direction of the swipe based on the velocity
    if (details.primaryVelocity! < 0) {
      // Swiped left (negative velocity), go to next item
      _nextItem();
    } else if (details.primaryVelocity! > 0) {
      // Swiped right (positive velocity), go to previous item
      _previousItem();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // Softer background color
      body: SafeArea(
        child: Stack(
          children: [
            // Main content with swipe detection
            GestureDetector(
              onHorizontalDragEnd: _handleSwipe, // Detect swipe gestures
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Letter/Number container
                  Container(
                    width: double.infinity,
                    height: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.gujaratiLetters[currentIndex],
                        style: const TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  // Sign language image container
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    padding: const EdgeInsets.all(16.0), // Add padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sign Language',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        // Fixed-size container for the image
                        Container(
                          width: 250, // Increased width for better visibility
                          height: 250, // Increased height for better visibility
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300, width: 2),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: widget.signLanguageImages[currentIndex].isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl: widget.signLanguageImages[currentIndex],
                                    fit: BoxFit.contain, // Fit the entire image within the container
                                    width: double.infinity,
                                    height: double.infinity,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) => const Center(
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 80,
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                      size: 80,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  // Navigation arrows at the bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_left,
                            color: Colors.lightBlue,
                            size: 32,
                          ),
                        ),
                        onPressed: currentIndex > 0 ? _previousItem : null,
                      ),
                      const SizedBox(width: 32.0),
                      IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_right,
                            color: Colors.lightBlue,
                            size: 32,
                          ),
                        ),
                        onPressed: currentIndex < widget.gujaratiLetters.length - 1 ? _nextItem : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Back button
            Positioned(
              top: 16.0,
              left: 16.0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.lightBlue,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}