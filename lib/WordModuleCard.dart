import 'package:flutter/material.dart';

void main() {
  runApp(DailyWordsApp());
}

class DailyWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DailyWordsPage(),
    );
  }
}

class DailyWordsPage extends StatelessWidget {
  final List<Map<String, String>> dailyWords = [
    {'english': 'Hello', 'gujarati': 'હેલો', 'signImage': 'assets/Symbols/hello_S.png', 'photo': 'assets/Images/hello.png'},
    {'english': 'Thank you', 'gujarati': 'આભાર', 'signImage': 'assets/Symbols/thankyou_S.png', 'photo': 'assets/Images/thankyou.png'},
    {'english': 'Please', 'gujarati': 'કૃપા કરીને', 'signImage': 'assets/Symbols/please_S.png', 'photo': 'assets/Images/please.png'},
    {'english': 'Yes', 'gujarati': 'હા', 'signImage': 'assets/Symbols/yes_S.png', 'photo': 'assets/Images/yes.png'},
    {'english': 'No', 'gujarati': 'ના', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Good morning', 'gujarati': 'શુભ સવાર', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Good night', 'gujarati': 'શુભ રાત્રી', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'How are you?', 'gujarati': 'તમે કેમ છો?', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Goodbye', 'gujarati': 'આવજો', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Friend', 'gujarati': 'મિત્ર', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Water', 'gujarati': 'પાણી', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Food', 'gujarati': 'ખોરાક', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Help', 'gujarati': 'મદદ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Sorry', 'gujarati': 'માફ કરશો', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Home', 'gujarati': 'ઘર', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'School', 'gujarati': 'શાળા', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Teacher', 'gujarati': 'શિક્ષક', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Book', 'gujarati': 'પુસ્તક', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Pen', 'gujarati': 'પેન', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Phone', 'gujarati': 'ફોન', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Car', 'gujarati': 'કાર', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Bus', 'gujarati': 'બસ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Train', 'gujarati': 'ટ્રેન', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Bike', 'gujarati': 'બાઇક', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Tree', 'gujarati': 'વૃક્ષ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Flower', 'gujarati': 'ફૂલ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Sun', 'gujarati': 'સૂર્ય', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Moon', 'gujarati': 'ચંદ્ર', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Star', 'gujarati': 'તારો', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Rain', 'gujarati': 'વરસાદ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Fire', 'gujarati': 'આગ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Wind', 'gujarati': 'પવન', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Earth', 'gujarati': 'પૃથ્વી', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Air', 'gujarati': 'હવા', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Dog', 'gujarati': 'કૂતરો', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Cat', 'gujarati': 'બિલાડી', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Horse', 'gujarati': 'ઘોડો', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Cow', 'gujarati': 'ગાય', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Goat', 'gujarati': 'બકરો', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Fish', 'gujarati': 'માછલી', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Bird', 'gujarati': 'પક્ષી', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Child', 'gujarati': 'બાળક', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Man', 'gujarati': 'પુરુષ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Woman', 'gujarati': 'સ્ત્રી', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Family', 'gujarati': 'કુટુંબ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Love', 'gujarati': 'પ્રેમ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Work', 'gujarati': 'કામ', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
    {'english': 'Play', 'gujarati': 'રમવા', 'signImage': 'assets/sign_hello.png', 'photo': 'assets/photo_hello.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue,
            child: Text(
              'Daily Words',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dailyWords.length,
              itemBuilder: (context, index) {
                return WordTile(
                  englishWord: dailyWords[index]['english']!,
                  gujaratiWord: dailyWords[index]['gujarati']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordDetailPage(
                          initialIndex: index,
                          dailyWords: dailyWords,
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
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  englishWord,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  gujaratiWord,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // English name container
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            'English: ${word['english']}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Gujarati name container
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            'Gujarati: ${word['gujarati']}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        // Images section (stacked vertically)
                        Column(
                          children: [
                            // Sign Language Image
                            Column(
                              children: [
                                const Text(
                                  'Sign Language',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Container(
                                  height: 200, // Fixed height for the image
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
                                    child: Image.asset(
                                      word['signImage']!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
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
                            const SizedBox(height: 24.0),
                            // Photo Image
                            Column(
                              children: [
                                const Text(
                                  'Photo',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Container(
                                  height: 200, // Fixed height for the image
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
                                    child: Image.asset(
                                      word['photo']!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
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
              ),
              const SizedBox(height: 24.0),
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
        ),
      ),
    );
  }
}