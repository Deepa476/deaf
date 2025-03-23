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
  {'english': 'Hello', 'gujarati': 'હેલો',
    'signImage': 'assets/Symbols/hello_S.png',
    'photo': 'assets/Images/hello.png'},
  {'english': 'Thank you', 'gujarati': 'આભાર',
    'signImage': 'assets/Symbols/thankyou_S.png',
    'photo': 'assets/Images/thankyou.png'},
  {'english': 'Please', 'gujarati': 'કૃપા કરીને',
    'signImage': 'assets/Symbols/please_S.png',
    'photo': 'assets/Images/please.png'},
  {'english': 'Yes', 'gujarati': 'હા',
    'signImage': 'assets/Symbols/yes_S.png',
    'photo': 'assets/Images/yes.png'},
  {'english': 'No', 'gujarati': 'ના',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Good morning', 'gujarati': 'શુભ સવાર',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Good night', 'gujarati': 'શુભ રાત્રી',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'How are you?', 'gujarati': 'તમે કેમ છો?',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Goodbye', 'gujarati': 'આવજો',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Friend', 'gujarati': 'મિત્ર',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Water', 'gujarati': 'પાણી',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Food', 'gujarati': 'ખોરાક',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Help', 'gujarati': 'મદદ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Sorry', 'gujarati': 'માફ કરશો',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Home', 'gujarati': 'ઘર',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'School', 'gujarati': 'શાળા',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Teacher', 'gujarati': 'શિક્ષક',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Book', 'gujarati': 'પુસ્તક',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Pen', 'gujarati': 'પેન',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Phone', 'gujarati': 'ફોન',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Car', 'gujarati': 'કાર',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Bus', 'gujarati': 'બસ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Train', 'gujarati': 'ટ્રેન',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Bike', 'gujarati': 'બાઇક',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Tree', 'gujarati': 'વૃક્ષ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Flower', 'gujarati': 'ફૂલ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Sun', 'gujarati': 'સૂર્ય',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Moon', 'gujarati': 'ચંદ્ર',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Star', 'gujarati': 'તારો',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Rain', 'gujarati': 'વરસાદ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Fire', 'gujarati': 'આગ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Wind', 'gujarati': 'પવન',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Earth', 'gujarati': 'પૃથ્વી',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Air', 'gujarati': 'હવા',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Dog', 'gujarati': 'કૂતરો',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Cat', 'gujarati': 'બિલાડી',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Horse', 'gujarati': 'ઘોડો',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Cow', 'gujarati': 'ગાય',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Goat', 'gujarati': 'બકરો',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Fish', 'gujarati': 'માછલી',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Bird', 'gujarati': 'પક્ષી',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Child', 'gujarati': 'બાળક',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Man', 'gujarati': 'પુરુષ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Woman', 'gujarati': 'સ્ત્રી',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Family', 'gujarati': 'કુટુંબ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Love', 'gujarati': 'પ્રેમ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Work', 'gujarati': 'કામ',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
  {'english': 'Play', 'gujarati': 'રમવા',
    'signImage': 'assets/sign_hello.png',
    'photo': 'assets/photo_hello.png'},
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
                          index: index,
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