import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage extends StatefulWidget {
  final int testNumber;
  final void Function()? onTestCompleted;

  const TestPage({super.key, required this.testNumber, this.onTestCompleted});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = List.filled(10, null);
  bool isNextPressed = false;
  bool isPreviousPressed = false;
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Map<int, List<QuestionModel>> testQuestions = {
    1: [
      QuestionModel("assets/images/birdsign.jpg", "What does this sign mean?", ["Bird", "Cat", "Dog", "Fish"], 0),
      QuestionModel("assets/images/catsign.jpg", "What does this sign mean?", ["Dog", "Mouse", "Cat", "Tiger"], 2),
      QuestionModel("assets/images/cowsign.jpg", "Identify the sign.", ["Goat", "Cow", "Buffalo", "Sheep"], 1),
      QuestionModel("assets/images/elephantsign.jpg", "Which animal does this represent?", ["Rhino", "Elephant", "Horse", "Deer"], 1),
      QuestionModel("assets/images/foxsign.jpg", "Recognize the sign.", ["Wolf", "Fox", "Coyote", "Jackal"], 1),
      QuestionModel("assets/images/frogsign.jpg", "What animal is shown?", ["Toad", "Lizard", "Frog", "Snake"], 2),
      QuestionModel("assets/images/giraffesign.jpg", "Which animal does this belong to?", ["Giraffe", "Camel", "Horse", "Zebra"], 0),
      QuestionModel("assets/images/goatsign.jpg", "Identify the animal.", ["Sheep", "Goat", "Cow", "Deer"], 1),
      QuestionModel("assets/images/lionsign.jpg", "What does this sign mean?", ["Tiger", "Lion", "Leopard", "Cheetah"], 1),
      QuestionModel("assets/images/monkeysign.jpg", "Recognize the sign.", ["Monkey", "Gorilla", "Chimpanzee", "Baboon"], 0),
    ],
    2: [
      QuestionModel("assets/images/apple.jpg", "What does this sign mean?", ["Apple", "Banana", "Grapes", "Mango"], 0),
      QuestionModel("assets/images/banana.jpg", "Identify the sign.", ["Mango", "Banana", "Pineapple", "Guava"], 1),
      QuestionModel("assets/images/grapes.jpg", "Which fruit is this?", ["Orange", "Grapes", "Peach", "Pear"], 1),
      QuestionModel("assets/images/mango.jpg", "What fruit is shown?", ["Apple", "Mango", "Papaya", "Plum"], 1),
      QuestionModel("assets/images/orange.jpg", "Recognize the sign.", ["Lemon", "Mandarin", "Orange", "Pomegranate"], 2),
      QuestionModel("assets/images/pineapple.jpg", "Which fruit does this represent?", ["Papaya", "Pineapple", "Jackfruit", "Coconut"], 1),
      QuestionModel("assets/images/strawberry.jpg", "Identify the correct fruit.", ["Cherry", "Raspberry", "Strawberry", "Watermelon"], 2),
      QuestionModel("assets/images/watermelon.jpg", "What does this sign mean?", ["Cucumber", "Melon", "Watermelon", "Pumpkin"], 2),
      QuestionModel("assets/images/pear.jpg", "Which fruit is represented?", ["Pear", "Fig", "Apricot", "Plum"], 0),
      QuestionModel("assets/images/pomegranate.jpg", "Recognize the sign.", ["Guava", "Pomegranate", "Lychee", "Dragonfruit"], 1),
    ],
    3: [
      QuestionModel("assets/images/circle.jpg", "What shape is this?", ["Circle", "Oval", "Hexagon", "Square"], 0),
      QuestionModel("assets/images/crescent.jpg", "Identify the shape.", ["Crescent", "Triangle", "Star", "Diamond"], 0),
      QuestionModel("assets/images/diamond.jpg", "Which shape is this?", ["Rectangle", "Hexagon", "Diamond", "Pentagon"], 2),
      QuestionModel("assets/images/heart.jpg", "What does this shape represent?", ["Circle", "Heart", "Star", "Oval"], 1),
      QuestionModel("assets/images/heptagon.jpg", "Recognize the shape.", ["Heptagon", "Hexagon", "Octagon", "Pentagon"], 0),
      QuestionModel("assets/images/hexagon.jpg", "What shape is shown?", ["Pentagon", "Hexagon", "Square", "Octagon"], 1),
      QuestionModel("assets/images/octagon.jpg", "Identify the correct shape.", ["Octagon", "Circle", "Hexagon", "Heptagon"], 0),
      QuestionModel("assets/images/oval.jpg", "Which shape does this represent?", ["Oval", "Circle", "Diamond", "Rectangle"], 0),
      QuestionModel("assets/images/pentagon.jpg", "What does this shape mean?", ["Hexagon", "Heptagon", "Pentagon", "Octagon"], 2),
      QuestionModel("assets/images/star.jpg", "Identify the shape.", ["Triangle", "Star", "Hexagon", "Crescent"], 1),
    ],
    4: [
      QuestionModel("assets/images/bitter gourd.jpg", "What vegetable is this?", ["Bitter Gourd", "Bottle Gourd", "Brinjal", "Cabbage"], 0),
      QuestionModel("assets/images/bottle gourd.jpg", "Identify the vegetable.", ["Carrot", "Pumpkin", "Bottle Gourd", "Potato"], 2),
      QuestionModel("assets/images/brinjal.jpg", "Which vegetable is shown?", ["Brinjal", "Onion", "Garlic", "Cabbage"], 0),
      QuestionModel("assets/images/cabbage.jpg", "What does this vegetable represent?", ["Cauliflower", "Cabbage", "Lettuce", "Spinach"], 1),
      QuestionModel("assets/images/carrot.jpg", "Recognize the vegetable.", ["Radish", "Beetroot", "Carrot", "Sweet Potato"], 2),
      QuestionModel("assets/images/cauliflower.jpg", "What vegetable is shown?", ["Broccoli", "Cabbage", "Cauliflower", "Lettuce"], 2),
      QuestionModel("assets/images/garlic.jpg", "Identify the correct vegetable.", ["Onion", "Ginger", "Garlic", "Radish"], 2),
      QuestionModel("assets/images/ginger.jpg", "Which vegetable does this represent?", ["Garlic", "Ginger", "Turmeric", "Potato"], 1),
      QuestionModel("assets/images/onion.jpg", "What does this vegetable mean?", ["Potato", "Onion", "Garlic", "Tomato"], 1),
      QuestionModel("assets/images/potato.jpg", "Identify the vegetable.", ["Potato", "Tomato", "Carrot", "Brinjal"], 0),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final List<QuestionModel> questions = testQuestions[widget.testNumber] ?? [];

    if (questions.isEmpty) {
      return _buildNoQuestionsScreen();
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: _buildAppBar(),
      body: _buildQuestionUI(questions),
    );
  }

  Widget _buildQuestionUI(List<QuestionModel> questions) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            questions[currentQuestionIndex].imagePath,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),
          Text(
            questions[currentQuestionIndex].questionText,
            style: const TextStyle(fontSize: 22, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: List.generate(4, (index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswers[currentQuestionIndex] == index
                        ? const Color.fromARGB(255, 138, 210, 255)
                        : Colors.white,
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedAnswers[currentQuestionIndex] = index;
                    });
                  },
                  child: Text(
                    questions[currentQuestionIndex].options[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isPreviousPressed ? 140 : 130,
                height: 50,
                child: ElevatedButton(
                  onPressed: currentQuestionIndex > 0
                      ? () {
                          setState(() {
                            currentQuestionIndex--;
                            isPreviousPressed = true;
                          });
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              isPreviousPressed = false;
                            });
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Previous", style: TextStyle(fontSize: 18)),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isNextPressed ? 140 : 130,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentQuestionIndex < questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                        isNextPressed = true;
                      });
                      Future.delayed(const Duration(milliseconds: 200), () {
                        setState(() {
                          isNextPressed = false;
                        });
                      });
                    } else {
                      _submitTest(questions);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    currentQuestionIndex < questions.length - 1 ? "Next" : "Submit",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitTest(List<QuestionModel> questions) async {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }

    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('test_scores')
            .doc('test_${widget.testNumber}')
            .set({
          'score': score,
          'total_questions': questions.length,
          'timestamp': FieldValue.serverTimestamp(),
          'test_number': widget.testNumber,
        }, SetOptions(merge: true));

        _showResultDialog(score, questions.length);
      } catch (e) {
        _showErrorDialog('Error saving score: $e');
      }
    } else {
      _showErrorDialog('Please log in to save your score');
    }
  }

  void _showResultDialog(int score, int total) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Test Completed"),
        content: Text("Your Score: $score / $total"),
        actions: [
          TextButton(
            onPressed: () {
              if (widget.onTestCompleted != null) {
                widget.onTestCompleted!();
              }
              Navigator.pop(context);
              Navigator.pop(context, score == 10);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Test ${widget.testNumber}',
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildNoQuestionsScreen() {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: _buildAppBar(),
      body: const Center(
        child: Text(
          "No Questions Available",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

class QuestionModel {
  final String imagePath;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  QuestionModel(this.imagePath, this.questionText, this.options, this.correctAnswerIndex);
}