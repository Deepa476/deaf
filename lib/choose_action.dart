import 'package:deaf/ConverPage.dart';
import 'package:flutter/material.dart';
import 'learning_modules_page.dart';// Import the Convert page


class ChooseActionPage extends StatelessWidget {
  const ChooseActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Background color blue
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choose ?', // Updated heading text
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigates to the Learning Modules Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LearningModulesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Learn',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue, // Dark blue text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '(alphabet, words, science, maths)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigates to the Convert Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConvertPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Convert',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue, // Dark blue text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '(Sign language to text and text to sign language)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Sign language - English - Gujarati',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The ConvertPage implementation
//import 'package:flutter/material.dart';


// class ConvertPage extends StatelessWidget {
//   const ConvertPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Signyy',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Column(

//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 200, // Placeholder for the central content
//               width: 300,
//               color: Colors.grey[300], // Light grey to represent placeholder area
//               child: Center(child: Text('Camera Access')),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Logic for English conversion
//               },
//               child: const Text('English'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Logic for Gujarati conversion
//               },
//               child: const Text('Gujarati'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'learning_modules_page.dart'; // Import the Learning Modules Page

// // class ChooseActionPage extends StatelessWidget {
// //   const ChooseActionPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blue, // Background color blue
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const Text(
// //                 'Choose ?', // Updated heading text
// //                 style: TextStyle(
// //                   fontSize: 32,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               const SizedBox(height: 40),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   // Navigates to the Learning Modules Page
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(builder: (context) => LearningModulesPage()),
// //                   );
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.white,
// //                   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //                 child: Column(
// //                   children: const [
// //                     Text(
// //                       'Learn',
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         color: Colors.blue, // Dark blue text
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     Text(
// //                       '(alphabet, words, science, maths)',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         color: Colors.blue,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {},
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.white,
// //                   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //                 child: Column(
// //                   children: const [
// //                     Text(
// //                       'Convert',
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         color: Colors.blue, // Dark blue text
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     Text(
// //                       '(Sign language to text and text to sign language)',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         color: Colors.blue,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 40),
// //               const Text(
// //                 'Sign language - English - Gujarati',
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
