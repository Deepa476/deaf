import 'package:flutter/material.dart';
import 'TestPage.dart'; // Import TestPage

class ProgressTracking extends StatefulWidget {
  const ProgressTracking({super.key});

  @override
  State<ProgressTracking> createState() => _ProgressTrackingState();
}

class _ProgressTrackingState extends State<ProgressTracking> {
  // List to track checkbox states
  List<bool> checkedItems = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Blue background
      appBar: AppBar(
        backgroundColor: Colors.blue, // Blue AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text(
          'Assignments',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0, // Remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // 10 items
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // Light shadow
                    blurRadius: 4,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: Checkbox(
                  shape: const CircleBorder(), // Circular checkbox
                  activeColor: Colors.blue, // Checked color
                  value: checkedItems[index],
                  onChanged: (bool? value) {
                    setState(() {
                      checkedItems[index] = value ?? false;
                    });
                  },
                ),
                title: Text(
                  'Test ${index + 1}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
               onTap: () async {
  // Wait for test result (true if 10/10, otherwise false)
  bool? completed = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TestPage(testNumber: index + 1, onTestCompleted: (int ) {  },),
    ),
  );

  // If the test is completed with 10/10, update the checkbox
  if (completed == true) {
    setState(() {
      checkedItems[index] = true;
    });
  }
},

              ),
            );
          },
        ),
      ),
    );
  }
}