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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFF024206),
              ),
              child: const Stack(
                children: [
                  // Centered grass icon
                  Center(
                    child: Icon(
                      Icons.grass,
                      size: 90,
                      color: Colors.orange,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Icon(
                      Icons.perm_identity_sharp,
                      size: 60,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            // Central part of the page with image and error message
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/tree.png', // Add your image path here
                    height: 450, // Adjust as needed
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
                        MaterialPageRoute(builder: (context) => const Page6()), //About
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
    );
  }
}
