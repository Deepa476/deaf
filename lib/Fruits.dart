import 'package:flutter/material.dart';


class Fruits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitsPage(),
    );
  }
}

class FruitsPage extends StatelessWidget {
  final List<Map<String, String>> fruitWords = [
  {
    'english': 'Apple',
    'gujarati': 'સફરજન',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/apple%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits//photo_apple.jpg'
  },
  {
    'english': 'Banana',
    'gujarati': 'કેળું',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/banana%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/photo_banana.jpg'
  },
  { 'english': 'Orange',
    'gujarati': 'સંતરા',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/orange%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/orange.jpg'
  },
  {'english': 'Grapes', 'gujarati': 'દ્રાક્ષ',
  'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/grapes%20sign.jpg',
  'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/grapes.jpg'
  },
  {'english': 'Pineapple', 'gujarati': 'આનાસ',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/pineapple%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/pineapple.jpg'
    },
  {'english': 'Strawberry', 'gujarati': 'સ્ટ્રોબેરી',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/berry%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/strawberry.jpg'
    },
  {'english': 'Watermelon', 'gujarati': 'તરબૂચ',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign//watermelon%20sign.webp',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/watermelon.jpg'
    },
  {'english': 'Cherry', 'gujarati': 'ચેરી',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/cherry%20sign.jpg',
    'photo': 'ahttps://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/Cherry.jpg'
    },
  {'english': 'Pomegranate', 'gujarati': 'દાડમ',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/pomegranate%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/pomegranate.jpg'
    },
  {'english': 'Guava', 'gujarati': 'મામરડી',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/guava.jpg',
    'photo': 'ahttps://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/guava.jpg'
    },
  {'english': 'Blueberry', 'gujarati': 'બ્લુબેરી',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/berry%20sign.jpg',
    'photo': 'ahttps://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/blueberry.jpg'
    },
  {'english': 'Coconut', 'gujarati': 'નારિયેઝ',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/coconut%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/coconut.jpg'
    },
  {'english': 'Avocado', 'gujarati': 'એવોકાડો',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/avocado%20sign.gif',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/avocado.jpg'
    },
  {'english': 'Raspberry', 'gujarati': 'રાસ્પબેરી',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/berry%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/Raspberry.jpg'
    },
  {'english': 'Blackberry', 'gujarati': 'બ્લેકબેરી',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/berry%20sign.jpg',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/blackberry.jpg'
    },
  {'english': 'Lemon', 'gujarati': 'લેમણ',
    'signImage': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits-sign/lemon%20sign.gif',
    'photo': 'https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/lemon.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Center(
          child: Text(
            'Daily Words',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: fruitWords.length,
        itemBuilder: (context, index) {
          return WordTile(
            englishWord: fruitWords[index]['english']!,
            gujaratiWord: fruitWords[index]['gujarati']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WordDetailPage(index: index, dailyWords: fruitWords),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WordTile extends StatelessWidget {
  final String englishWord;
  final String gujaratiWord;
  final VoidCallback onTap;

  const WordTile({required this.englishWord, required this.gujaratiWord, required this.onTap});

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
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
                child: Text(englishWord, style: TextStyle(fontSize: 18, color: Colors.blue), textAlign: TextAlign.center),
              ),
            ),
            SizedBox(width: 8.0),
            Icon(Icons.arrow_forward, color: Colors.white),
            SizedBox(width: 8.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
                child: Text(gujaratiWord, style: TextStyle(fontSize: 18, color: Colors.blue), textAlign: TextAlign.center),
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

  const WordDetailPage({required this.index, required this.dailyWords});

  String getValidImageUrl(String? path) {
    if (path == null || path.isEmpty) return "";
    if (path.startsWith("http")) return path;
    return "https://maatgqzlgvtqhywmblge.supabase.co/storage/v1/object/public/fruits/$path";
  }

  @override
  Widget build(BuildContext context) {
    final word = dailyWords[index];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(word['english']!, style: TextStyle(color: Colors.white)),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  'English Name: ${word['english']}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  'Gujarati Name: ${word['gujarati']}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            _buildImage(getValidImageUrl(word['signImage']), "Sign Image"),
            SizedBox(height: 16.0),
            _buildImage(getValidImageUrl(word['photo']), "Photo"),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (index > 0)
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 32, color: Colors.blue),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WordDetailPage(index: index - 1, dailyWords: dailyWords),
                        ),
                      );
                    },
                  ),
                if (index < dailyWords.length - 1)
                  IconButton(
                    icon: Icon(Icons.arrow_forward, size: 32, color: Colors.blue),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WordDetailPage(index: index + 1, dailyWords: dailyWords),
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

  Widget _buildImage(String imageUrl, String description) {
    if (imageUrl.isEmpty) return Text("No $description available");
    return imageUrl.startsWith("assets/")
        ? Image.asset(imageUrl, fit: BoxFit.cover)
        : Image.network(imageUrl, fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(child: CircularProgressIndicator());
          }, errorBuilder: (context, error, stackTrace) {
            return Text("Error loading $description");
          });
  }
}