import 'package:flutter/material.dart';

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
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/dog%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/dog.jpg'},
  {'english': 'Cat', 'gujarati': 'બિલાડી',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/cat%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/cat.jpg'},
  {'english': 'Cow', 'gujarati': 'ગાય',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/cow%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/cow.jpg'},
  {'english': 'Horse', 'gujarati': 'ઘોડો',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/horse%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/horse.jpg'},
  {'english': 'Goat', 'gujarati': 'બકરો',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/goat%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/goat.jpg'},
  {'english': 'Elephant', 'gujarati': 'હાથી',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/elephant%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/elephant.jpg'},
  {'english': 'Tiger', 'gujarati': 'વાઘ',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/tiger%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/tiger.jpg'},
  {'english': 'Lion', 'gujarati': 'સિંહ',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/lion%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/lion.jpg'},
  {'english': 'Monkey', 'gujarati': 'વાંદર',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/monkey%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/monkey.jpg'},
  {'english': 'Fish', 'gujarati': 'માછલી',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/fish%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/fish.jpg'},
  {'english': 'Bird', 'gujarati': 'પક્ષી',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/bird%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/bird.jpg'},
  {'english': 'Snake', 'gujarati': 'સર્પ',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/snake%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/snake.jpg'},
  {'english': 'Rabbit', 'gujarati': 'સસા',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/rabbit%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/rabbit.jpg'},
  {'english': 'Fox', 'gujarati': 'લુમ્મો',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/fox%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/fox.jpg'},
  {'english': 'Wolf', 'gujarati': 'ભેડિયો',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/wolf%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/wolf.jpg'},
  {'english': 'Frog', 'gujarati': 'દેડકો',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/frog%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/frog.jpg'},
  {'english': 'Crocodile', 'gujarati': 'મગર',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/crocodile%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/crocodile.jpg'},
  {'english': 'Zebra', 'gujarati': 'ઝીબ્રા',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/zebra%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/Zebra.jpg'},
  {'english': 'Giraffe', 'gujarati': 'જીરાફ',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/giraffe%20sign.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/giraffe.jpg'},
  {'english': 'Penguin', 'gujarati': 'પેંગ્વિન',
    'signImage': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/sign/penguin.jpg',
    'photo': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/animals/normal/penguin.jpg'},
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
                      child: Image.network(
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
                      child: Image.network(
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