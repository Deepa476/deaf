import 'package:flutter/material.dart';

void main() {
  runApp(ShapeApp());
}

class ShapeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShapeAppPage(),
    );
  }
}

class ShapeAppPage extends StatelessWidget {
final List<Map<String, String>> shapeWords = [
  {'english': 'Circle', 'gujarati': 'વૃત્ત',
    'signImage': 'assets/Symbols/circle_S.png',
    'photo': 'assets/Images/circle.png'},
  {'english': 'Square', 'gujarati': 'ચોરસ',
    'signImage': 'assets/Symbols/square_S.png',
    'photo': 'assets/Images/square.png'},
  {'english': 'Rectangle', 'gujarati': 'આયત',
    'signImage': 'assets/Symbols/rectangle_S.png',
    'photo': 'assets/Images/rectangle.png'},
  {'english': 'Triangle', 'gujarati': 'ત્રિકોણ',
    'signImage': 'assets/Symbols/triangle_S.png',
    'photo': 'assets/Images/triangle.png'},
  {'english': 'Oval', 'gujarati': 'અંડાકાર',
    'signImage': 'assets/Symbols/oval_S.png',
    'photo': 'assets/Images/oval.png'},
  {'english': 'Pentagon', 'gujarati': 'પાંચભુજ',
    'signImage': 'assets/Symbols/pentagon_S.png',
    'photo': 'assets/Images/pentagon.png'},
  {'english': 'Hexagon', 'gujarati': 'ષટ્કોણ',
    'signImage': 'assets/Symbols/hexagon_S.png',
    'photo': 'assets/Images/hexagon.png'},
  {'english': 'Heptagon', 'gujarati': 'સપ્તકોણ',
    'signImage': 'assets/Symbols/heptagon_S.png',
    'photo': 'assets/Images/heptagon.png'},
  {'english': 'Octagon', 'gujarati': 'અષ્ટકોણ',
    'signImage': 'assets/Symbols/octagon_S.png',
    'photo': 'assets/Images/octagon.png'},
  {'english': 'Star', 'gujarati': 'તારો',
    'signImage': 'assets/Symbols/star_S.png',
    'photo': 'assets/Images/star.png'},
  {'english': 'Heart', 'gujarati': 'હ્રદય',
    'signImage': 'assets/Symbols/heart_S.png',
    'photo': 'assets/Images/heart.png'},
  {'english': 'Diamond', 'gujarati': 'હીરાકાર',
    'signImage': 'assets/Symbols/diamond_S.png',
    'photo': 'assets/Images/diamond.png'},
  {'english': 'Crescent', 'gujarati': 'અર્ધચંદ્ર',
    'signImage': 'assets/Symbols/crescent_S.png',
    'photo': 'assets/Images/crescent.png'},
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
              itemCount: shapeWords.length,
              itemBuilder: (context, index) {
                return WordTile(
                  englishWord: shapeWords[index]['english']!,
                  gujaratiWord: shapeWords[index]['gujarati']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordDetailPage(
                          index: index,
                          dailyWords: shapeWords,
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

class WordDetailPage extends StatelessWidget {
  final int index;
  final List<Map<String, String>> dailyWords;

  const WordDetailPage({
    required this.index,
    required this.dailyWords,
  });

  @override
  Widget build(BuildContext context) {
    final word = dailyWords[index];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          word['english']!,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 60,  // Fixed height for English name container
              child: Center(
                child: Text(
                  'English Name: ${word['english']}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 60,  // Fixed height for Gujarati name container
              child: Center(
                child: Text(
                  'Gujarati Name: ${word['gujarati']}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20.0), // Add spacing between sections
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        word['signImage']!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        word['photo']!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0), // Add spacing before navigation icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (index > 0)
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WordDetailPage(
                            index: index - 1,
                            dailyWords: dailyWords,
                          ),
                        ),
                      );
                    },
                  ),
                if (index < dailyWords.length - 1)
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WordDetailPage(
                            index: index + 1,
                            dailyWords: dailyWords,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}