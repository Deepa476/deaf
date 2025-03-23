import 'package:flutter/material.dart';

void main() {
  runApp(AnimalApp());
}

class AnimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimalAppPage(),
    );
  }
}

class AnimalAppPage extends StatelessWidget {
  final List<Map<String, String>> animalWords = [
    {
      'english': 'Dog',
      'gujarati': 'કૂતરો',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/dog%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/dog.jpg'
    },
    {
      'english': 'Cat',
      'gujarati': 'બિલાડી',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/cat%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/cat.jpg'
    },
    {
      'english': 'Cow',
      'gujarati': 'ગાય',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/cow%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/cow.jpg'
    },
    {
      'english': 'Horse',
      'gujarati': 'ઘોડો',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/horse%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/horse.jpg'
    },
    {
      'english': 'Goat',
      'gujarati': 'બકરો',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/goat%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/goat.jpg'
    },
    {
      'english': 'Elephant',
      'gujarati': 'હાથી',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/elephant%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/elephant.jpg'
    },
    {
      'english': 'Tiger',
      'gujarati': 'વાઘ',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/tiger%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/tiger.jpg'
    },
    {
      'english': 'Lion',
      'gujarati': 'સિંહ',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/lion%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/lion.jpg'
    },
    {
      'english': 'Monkey',
      'gujarati': 'વાંદર',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/monkey%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/monkey.jpg'
    },
    {
      'english': 'Fish',
      'gujarati': 'માછલી',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/fish%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/fish.jpg'
    },
    {
      'english': 'Bird',
      'gujarati': 'પક્ષી',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/bird%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/bird.jpg'
    },
    {
      'english': 'Snake',
      'gujarati': 'સર્પ',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/snake%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/snake.jpg'
    },
    {
      'english': 'Rabbit',
      'gujarati': 'સસા',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/rabbit%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/rabbit.jpg'
    },
    {
      'english': 'Fox',
      'gujarati': 'લુમ્મો',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/fox%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/fox.jpg'
    },
    {
      'english': 'Wolf',
      'gujarati': 'ભેડિયો',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/wolf%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/wolf.jpg'
    },
    {
      'english': 'Frog',
      'gujarati': 'દેડકો',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/frog%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/frog.jpg'
    },
    {
      'english': 'Crocodile',
      'gujarati': 'મગર',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/crocodile%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/crocodile.jpg'
    },
    {
      'english': 'Zebra',
      'gujarati': 'ઝીબ્રા',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/zebra%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/Zebra.jpg'
    },
    {
      'english': 'Giraffe',
      'gujarati': 'જીરાફ',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/giraffe%20sign.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/giraffe.jpg'
    },
    {
      'english': 'Penguin',
      'gujarati': 'પેંગ્વિન',
      'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/penguin.jpg',
      'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/penguin.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: const Center(
          child: Text(
            'Animals',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: animalWords.length,
              itemBuilder: (context, index) {
                return WordTile(
                  englishWord: animalWords[index]['english']!,
                  gujaratiWord: animalWords[index]['gujarati']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordDetailPage(
                          initialIndex: index,
                          dailyWords: animalWords,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WordTile extends StatelessWidget {
  final String englishWord;
  final String gujaratiWord;
  final VoidCallback onTap;

  const WordTile({
    required this.englishWord,
    required this.gujaratiWord,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  englishWord,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  gujaratiWord,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WordDetailPage extends StatefulWidget {
  final int initialIndex;
  final List<Map<String, String>> dailyWords;

  const WordDetailPage({
    required this.initialIndex,
    required this.dailyWords,
  });

  @override
  _WordDetailPageState createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
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
      if (currentIndex < widget.dailyWords.length - 1) {
        currentIndex++;
      }
    });
  }

  void _handleSwipe(DragEndDetails details) {
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
    final word = widget.dailyWords[currentIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text(
          word['english']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: _handleSwipe,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Get the available height and width from LayoutBuilder
            final availableHeight = constraints.maxHeight;
            final availableWidth = constraints.maxWidth;

            // Define minimum and maximum heights for components
            const minNameHeight = 40.0;
            const maxNameHeight = 60.0;
            const minImageHeight = 80.0;
            const maxImageHeight = 150.0;
            const navigationHeight = 80.0; // Navigation arrows + padding
            const verticalPadding = 16.0 * 2; // Top and bottom padding
            const spacingBetweenElements = 8.0 * 5; // Spaces between name containers, images, and labels

            // Calculate the total height required for all components (excluding dynamic heights)
            final fixedHeight = navigationHeight + verticalPadding + spacingBetweenElements;

            // Calculate the remaining height for dynamic components (name containers and images)
            final remainingHeight = availableHeight - fixedHeight;

            // Calculate the ideal heights for name containers and images
            double nameHeight = remainingHeight * 0.15; // 15% of remaining height for each name container
            double imageHeight = remainingHeight * 0.35; // 35% of remaining height for each image

            // Apply minimum and maximum constraints to prevent overflow or tiny components
            nameHeight = nameHeight.clamp(minNameHeight, maxNameHeight);
            imageHeight = imageHeight.clamp(minImageHeight, maxImageHeight);

            // Calculate the total height of the content
            final totalContentHeight = (nameHeight * 2) + (imageHeight * 2) + fixedHeight;

            // Calculate a scaling factor if the content overflows
            final scaleFactor = totalContentHeight > availableHeight ? availableHeight / totalContentHeight : 1.0;

            // Adjust heights based on the scaling factor
            final scaledNameHeight = nameHeight * scaleFactor;
            final scaledImageHeight = imageHeight * scaleFactor;

            // Adjust font sizes based on screen height
            final screenHeight = MediaQuery.of(context).size.height;
            final nameFontSize = screenHeight < 600 ? 16.0 : 20.0;
            final labelFontSize = screenHeight < 600 ? 12.0 : 16.0;

            // Calculate the image container width to maintain a reasonable aspect ratio
            final imageWidth = availableWidth - 32.0; // Subtract padding (16.0 on each side)

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: [
                  // Main content (card)
                  Container(
                    width: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // English name container
                          Container(
                            width: double.infinity,
                            height: scaledNameHeight,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Text(
                                'English: ${word['english']}',
                                style: TextStyle(
                                  fontSize: nameFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Gujarati name container
                          Container(
                            width: double.infinity,
                            height: scaledNameHeight,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Text(
                                'Gujarati: ${word['gujarati']}',
                                style: TextStyle(
                                  fontSize: nameFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Images section (stacked vertically)
                          Column(
                            children: [
                              // Sign Language Image
                              Column(
                                children: [
                                  Text(
                                    'Sign Language',
                                    style: TextStyle(
                                      fontSize: labelFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Container(
                                    width: imageWidth,
                                    height: scaledImageHeight,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300, width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        word['signImage']!,
                                        fit: BoxFit.contain, // Ensure the entire image is visible
                                        width: imageWidth,
                                        height: scaledImageHeight,
                                        errorBuilder: (context, error, stackTrace) => const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              // Photo Image
                              Column(
                                children: [
                                  Text(
                                    'Photo',
                                    style: TextStyle(
                                      fontSize: labelFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Container(
                                    width: imageWidth,
                                    height: scaledImageHeight,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300, width: 2),
                                      borderRadius: BorderRadius.circular(12.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        word['photo']!,
                                        fit: BoxFit.contain, // Ensure the entire image is visible
                                        width: imageWidth,
                                        height: scaledImageHeight,
                                        errorBuilder: (context, error, stackTrace) => const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Navigation arrows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: currentIndex > 0 ? Colors.white.withOpacity(0.8) : Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_left,
                            color: currentIndex > 0 ? Colors.lightBlue : Colors.grey,
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
                            color: currentIndex < widget.dailyWords.length - 1 ? Colors.white.withOpacity(0.8) : Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_right,
                            color: currentIndex < widget.dailyWords.length - 1 ? Colors.lightBlue : Colors.grey,
                            size: 32,
                          ),
                        ),
                        onPressed: currentIndex < widget.dailyWords.length - 1 ? _nextItem : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}