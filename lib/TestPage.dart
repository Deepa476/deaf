import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  final int testNumber;
  final Function(int) onTestCompleted; // Callback function to update checkbox

  const TestPage({super.key, required this.testNumber, required this.onTestCompleted});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int currentQuestionIndex = 0; // Track current question
  List<int?> selectedAnswers = List.filled(10, null); // Store selected answers
  bool isNextPressed = false;
  bool isPreviousPressed = false;

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
    QuestionModel("assets/images/applesign.jpg", "What does this sign mean?", ["Apple", "Banana", "Grapes", "Mango"], 0),
    QuestionModel("assets/images/bananasign.jpg", "Identify the sign.", ["Mango", "Banana", "Pineapple", "Guava"], 1),
    QuestionModel("assets/images/grapessign.jpg", "Which fruit is this?", ["Orange", "Grapes", "Peach", "Pear"], 1),
    QuestionModel("assets/images/mangosign.jpg", "What fruit is shown?", ["Apple", "Mango", "Papaya", "Plum"], 1),
    QuestionModel("assets/images/orangesign.jpg", "Recognize the sign.", ["Lemon", "Mandarin", "Orange", "Pomegranate"], 2),
    QuestionModel("assets/images/pineapplesign.jpg", "Which fruit does this represent?", ["Papaya", "Pineapple", "Jackfruit", "Coconut"], 1),
    QuestionModel("assets/images/strawberrysign.jpg", "Identify the correct fruit.", ["Cherry", "Raspberry", "Strawberry", "Watermelon"], 2),
    QuestionModel("assets/images/watermelonsign.jpg", "What does this sign mean?", ["Cucumber", "Melon", "Watermelon", "Pumpkin"], 2),
    QuestionModel("assets/images/pearsign.jpg", "Which fruit is represented?", ["Pear", "Fig", "Apricot", "Plum"], 0),
    QuestionModel("assets/images/pomegranatesign.jpg", "Recognize the sign.", ["Guava", "Pomegranate", "Lychee", "Dragonfruit"], 1),
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
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            questions[currentQuestionIndex].imagePath,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30), // Increased spacing
          Text(
            questions[currentQuestionIndex].questionText,
            style: const TextStyle(fontSize: 22, color: Colors.white), // Increased font size
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Options as 2x2 Grid Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: List.generate(4, (index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.45, // 45% of screen width
                height: 60, // Increased height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswers[currentQuestionIndex] == index
                        ? Color.fromARGB(255, 138, 210, 255) // Selected answer color
                        : Colors.white,
                    foregroundColor: Color.fromARGB(255, 0, 0, 0), // Text color
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
    fontSize: 20, // Increased font size
    fontWeight: FontWeight.bold, // Bold text
  ),
),

                ),
              );
            }),
          ),
          const SizedBox(height: 40), // Added spacing

          // Next & Previous Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isPreviousPressed ? 140 : 130, // Increased width
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
                  child: const Text("Previous", style: TextStyle(fontSize: 18)), // Increased font size
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isNextPressed ? 140 : 130, // Increased width
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
                  child: Text(currentQuestionIndex < questions.length - 1 ? "Next" : "Submit",
                      style: const TextStyle(fontSize: 18)), // Increased font size
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitTest(List<QuestionModel> questions) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Test Completed"),
        content: Text("Your Score: $score / ${questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, score == 10);
            },
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

// *Data Model for Questions*
class QuestionModel {
  final String imagePath;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  QuestionModel(this.imagePath, this.questionText, this.options, this.correctAnswerIndex);
}