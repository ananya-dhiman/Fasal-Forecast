import 'package:flutter/material.dart';

void main() {
  runApp(const Page12());
}

class Page12 extends StatelessWidget {
  const Page12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedback Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF7CB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Section
          Container(
            width: double.infinity,
            height: 250, // Adjust height as needed
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
                // Positioned avatar icon at the lower right side
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
          const SizedBox(height: 150), // Space between the top section and the body content

          // Rest of the Body
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(
                    'FEEDBACK',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB81C),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Title of the problem',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Rounded corners
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Rounded corners
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF024206), // button background color
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white, // text color
                        fontSize: 18, // text size
                        fontWeight: FontWeight.bold, // bold text
                        letterSpacing: 2.0, // spacing between letters
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
