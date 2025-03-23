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
  {'english': 'Dog', 'gujarati': 'કૂતરો',
    'signImage': 'assets/Symbols/dog_S.png',
    'photo': 'assets/Images/dog.png'},
  {'english': 'Cat', 'gujarati': 'બિલાડી',
    'signImage': 'assets/Symbols/cat_S.png',
    'photo': 'assets/Images/cat.png'},
  {'english': 'Cow', 'gujarati': 'ગાય',
    'signImage': 'assets/Symbols/cow_S.png',
    'photo': 'assets/Images/cow.png'},
  {'english': 'Horse', 'gujarati': 'ઘોડો',
    'signImage': 'assets/Symbols/horse_S.png',
    'photo': 'assets/Images/horse.png'},
  {'english': 'Goat', 'gujarati': 'બકરો',
    'signImage': 'assets/Symbols/goat_S.png',
    'photo': 'assets/Images/goat.png'},
  {'english': 'Elephant', 'gujarati': 'હાથી',
    'signImage': 'assets/Symbols/elephant_S.png',
    'photo': 'assets/Images/elephant.png'},
  {'english': 'Tiger', 'gujarati': 'વાઘ',
    'signImage': 'assets/Symbols/tiger_S.png',
    'photo': 'assets/Images/tiger.png'},
  {'english': 'Lion', 'gujarati': 'સિંહ',
    'signImage': 'assets/Symbols/lion_S.png',
    'photo': 'assets/Images/lion.png'},
  {'english': 'Monkey', 'gujarati': 'વાંદર',
    'signImage': 'assets/Symbols/monkey_S.png',
    'photo': 'assets/Images/monkey.png'},
  {'english': 'Fish', 'gujarati': 'માછલી',
    'signImage': 'assets/Symbols/fish_S.png',
    'photo': 'assets/Images/fish.png'},
  {'english': 'Bird', 'gujarati': 'પક્ષી',
    'signImage': 'assets/Symbols/bird_S.png',
    'photo': 'assets/Images/bird.png'},
  {'english': 'Snake', 'gujarati': 'સર્પ',
    'signImage': 'assets/Symbols/snake_S.png',
    'photo': 'assets/Images/snake.png'},
  {'english': 'Rabbit', 'gujarati': 'સસા',
    'signImage': 'assets/Symbols/rabbit_S.png',
    'photo': 'assets/Images/rabbit.png'},
  {'english': 'Deer', 'gujarati': 'હરણ',
    'signImage': 'assets/Symbols/deer_S.png',
    'photo': 'assets/Images/deer.png'},
  {'english': 'Bear', 'gujarati': 'ભાલુ',
    'signImage': 'assets/Symbols/bear_S.png',
    'photo': 'assets/Images/bear.png'},
  {'english': 'Fox', 'gujarati': 'લુમ્મો',
    'signImage': 'assets/Symbols/fox_S.png',
    'photo': 'assets/Images/fox.png'},
  {'english': 'Wolf', 'gujarati': 'ભેડિયો',
    'signImage': 'assets/Symbols/wolf_S.png',
    'photo': 'assets/Images/wolf.png'},
  {'english': 'Frog', 'gujarati': 'દેડકો',
    'signImage': 'assets/Symbols/frog_S.png',
    'photo': 'assets/Images/frog.png'},
  {'english': 'Sheep', 'gujarati': 'ધોલ',
    'signImage': 'assets/Symbols/sheep_S.png',
    'photo': 'assets/Images/sheep.png'},
  {'english': 'Camel', 'gujarati': 'ઉંટ',
    'signImage': 'assets/Symbols/camel_S.png',
    'photo': 'assets/Images/camel.png'},
  {'english': 'Crocodile', 'gujarati': 'મગર',
    'signImage': 'assets/Symbols/crocodile_S.png',
    'photo': 'assets/Images/crocodile.png'},
  {'english': 'Zebra', 'gujarati': 'ઝીબ્રા',
    'signImage': 'assets/Symbols/zebra_S.png',
    'photo': 'assets/Images/zebra.png'},
  {'english': 'Giraffe', 'gujarati': 'જીરાફ',
    'signImage': 'assets/Symbols/giraffe_S.png',
    'photo': 'assets/Images/giraffe.png'},
  {'english': 'Penguin', 'gujarati': 'પેંગ્વિન',
    'signImage': 'assets/Symbols/penguin_S.png',
    'photo': 'assets/Images/penguin.png'},
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
                          index: index,
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