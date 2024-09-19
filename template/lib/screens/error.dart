import 'package:flutter/material.dart';
import 'dart:async';
import 'package:template/screens/upload_photo.dart';

class Page11 extends StatefulWidget {
  const Page11({super.key});

  @override
  State<Page11> createState() => _Page11State();
}

class _Page11State extends State<Page11> {
  bool _showTransitionPage = true; // To track whether to show the transition page or the main content

  @override
  void initState() {
    super.initState();
    // Delay for 7 seconds and then show the main page
    Timer(const Duration(seconds: 6), () {
      setState(() {
        _showTransitionPage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _showTransitionPage
            ? const Color(0xFFD2E7D0) // Background for transition page
            : const Color(0xFFFFB81C), // Background for the main content
        body: _showTransitionPage ? _buildTransitionPage() : _buildMainContent(),
      ),
    );
  }

  // Widget for the transition page (predicting page)
  Widget _buildTransitionPage() {
    return Container(
      color: const Color(0xFFD9F1C9), // Set background color for the page
      child: Center(
        child: Container(
          height: 380,
          width: 320,
          padding: const EdgeInsets.all(20), // Padding inside the container
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50), // Margin around the container
          decoration: BoxDecoration(
            color: const Color(0xFFFFB81C), // Background color for the container
            borderRadius: BorderRadius.circular(15), // Rounded corners
            border: Border.all(
              color: Colors.black54,
              width: 2, // Border width
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26, // Shadow color
                blurRadius: 9, // Shadow blur
                offset: Offset(7, 10), // Shadow position
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Predicting...🤔🤔',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF024206), // Text color
                  ),
                  textAlign: TextAlign.center, // Align text to center
                ),
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                color: Color(0xFF024206),
              ), // Show loading indicator
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Fun Fact: Did you know plants can communicate through chemicals?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black, // Text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  // Widget for the main page content (after transition)
  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xFF024206),
            ),
            child: const Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.grass,
                    size: 80,
                    color: Colors.orange,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 30,
                  child: Icon(
                    Icons.perm_identity_sharp,
                    size: 50,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/tree.png',
                  height: 450,
                ),
                const SizedBox(height: 20),
                const Text(
                  'ERROR!\nTHE IMAGE YOU GAVE US\nWAS NOT OF A CROP OR PLANT.\nPLEASE TRY AGAIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF024206),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Define the action for Try Again button
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Page6()), // Navigate to the same page for simplicity
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF024206), // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



void main() {
  runApp(const Page11());
}
