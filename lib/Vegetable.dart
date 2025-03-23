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
    {'english': 'Tomato', 'gujarati': 'ટમેટા'},
    {'english': 'Potato', 'gujarati': 'બટાટા'},
    {'english': 'Carrot', 'gujarati': 'ગાજર'},
    {'english': 'Onion', 'gujarati': 'ડુંગળી'},
    {'english': 'Spinach', 'gujarati': 'પાલક'},
    {'english': 'Cabbage', 'gujarati': 'કોબી'},
    {'english': 'Cauliflower', 'gujarati': 'ફુલાવર'},
    {'english': 'Garlic', 'gujarati': 'લસણ'},
    {'english': 'Ginger', 'gujarati': 'આદુ'},
    {'english': 'Cucumber', 'gujarati': 'કાકડી'},
    {'english': 'Brinjal', 'gujarati': 'રીંગણ'},
    {'english': 'Ladyfinger', 'gujarati': 'ભીંડા'},
    {'english': 'Bottle Gourd', 'gujarati': 'દૂધી'},
    {'english': 'Pumpkin', 'gujarati': 'કદૂ'},
    {'english': 'Bitter Gourd', 'gujarati': 'કરેલા'},
    {'english': 'Capsicum', 'gujarati': 'શિમલા મરચા'},
    {'english': 'Fenugreek Leaves', 'gujarati': 'મેથી'},
    {'english': 'Peas', 'gujarati': 'વટાણા'},
    {'english': 'Radish', 'gujarati': 'મૂળી'},
    {'english': 'Turnip', 'gujarati': 'શલગમ'},
    {'english': 'Beetroot', 'gujarati': 'ચુકંદર'},
    {'english': 'Sweet Potato', 'gujarati': 'શક્કરિયાં'},
    {'english': 'Broccoli', 'gujarati': 'બ્રોકોલી'},
    {'english': 'Zucchini', 'gujarati': 'તુરિયાં'},
    {'english': 'Lettuce', 'gujarati': 'લેટીસ'},
    {'english': 'Drumstick', 'gujarati': 'સુંગટા'},
    {'english': 'Green Beans', 'gujarati': 'શીમ'},
    {'english': 'Cluster Beans', 'gujarati': 'ગવાર ફળી'},
    {'english': 'Chili Pepper', 'gujarati': 'મરચું'},
    {'english': 'Coriander', 'gujarati': 'ધાણા'},
    {'english': 'Mint Leaves', 'gujarati': 'ફુદીનો'},
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
                  child: Center(
                    child: Text(
                      'Sign Language for ${vegetable['english']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  child: Center(
                    child: Text(
                      'Image of ${vegetable['english']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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