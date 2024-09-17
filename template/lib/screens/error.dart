import 'package:flutter/material.dart';
import './upload_photo.dart';

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFB81C), // Background color
        body: SingleChildScrollView( // Wrap content in a scroll view
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
                    // Centered grass icon
                    Center(
                      child: Icon(
                        Icons.grass,
                        size: 80,
                        color: Colors.orange,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Icon(
                        Icons.perm_identity_sharp,
                        size: 50,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),

              // Central part of the page with image and error message
              Padding(
                padding: const EdgeInsets.all(16.0), // Add some padding for better spacing
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/tree.png', // Add your image path here
                      height: MediaQuery.of(context).size.height * 0.4, // Adjust dynamically
                      fit: BoxFit.contain, // Make the image fit well
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
                          MaterialPageRoute(builder: (context) => const Page6()), // Replace with your actual page
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF024206), // Button color
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
        ),
      ),
    );
  }
}
