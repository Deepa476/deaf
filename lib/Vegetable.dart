import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VegetableList(),
    );
  }
}

class VegetableList extends StatelessWidget {
  // List of vegetable names in English and Gujarati
  final List<Map<String, String>> vegetables = [
    {'english': 'Tomato', 'gujarati': 'ટમેટા',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/tomato.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/tomato%20sign.gif'},
    {'english': 'Potato', 'gujarati': 'બટાટા',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/potato.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/potato%20sign.gif'},
    {'english': 'Carrot', 'gujarati': 'ગાજર',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/carrot.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/carrot%20sign.jpg'},
    {'english': 'Onion', 'gujarati': 'ડુંગળી',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/onion.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/onion%20sign.gif'},
    {'english': 'Cabbage', 'gujarati': 'કોબી',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/cabbage.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/cabbage%20sign.jpg'},
    {'english': 'Garlic', 'gujarati': 'લસણ',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/garlic.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/garlic%20sign.jpg'},
    {'english': 'Brinjal', 'gujarati': 'રીંગણ',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/brinjal.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/brinjal%20sign.jpg'},
    {'english': 'Bottle Gourd', 'gujarati': 'દૂધી',
    'normal': 'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/normal/bottle%20gourd.jpg',
    'signImage':'https://vrficwgiqdstlgvcqasu.supabase.co/storage/v1/object/public/learningmodule/vegetables/sign/bottle%20gourd%20sign.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Vegetables'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Placeholder for more options
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Vegetable Names in English & Gujarati',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: vegetables.length,
                itemBuilder: (context, index) {
                  final vegetable = vegetables[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VegetableDetailPage(
                              vegetables: vegetables,
                              currentIndex: index,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          // English name box
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                vegetable['english']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '→',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // Gujarati name box
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                vegetable['gujarati']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VegetableDetailPage extends StatelessWidget {
  final List<Map<String, String>> vegetables;
  final int currentIndex;

  VegetableDetailPage({
    required this.vegetables,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final vegetable = vegetables[currentIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(vegetable['english']!),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder for sign language
                Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        vegetable['normal']!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                ),
                SizedBox(height: 30),
                // Placeholder for vegetable image
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        vegetable['signImage']!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                ),
                SizedBox(height: 30),
                // Box for English name
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    vegetable['english']!,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Box for Gujarati name
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    vegetable['gujarati']!,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 25,
              child: currentIndex > 0
                  ? IconButton(
                      icon: Icon(Icons.arrow_back, size: 40, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VegetableDetailPage(
                              vegetables: vegetables,
                              currentIndex: currentIndex - 1,
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox.shrink(),
            ),
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 25,
              child: currentIndex < vegetables.length - 1
                  ? IconButton(
                      icon: Icon(Icons.arrow_forward, size: 40, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VegetableDetailPage(
                              vegetables: vegetables,
                              currentIndex: currentIndex + 1,
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}