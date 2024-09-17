import 'package:flutter/material.dart';

class Page9 extends StatefulWidget {
  const Page9({super.key});

  @override
  _Page9State createState() => _Page9State();
}

class _Page9State extends State<Page9> {
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/seed.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'CONGRATULATIONS!\nYOU WON A SEED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'KEEP UPLOADING PICTURES AND\nGROW A SAPLING',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Results page or another action.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF024206),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'RESULTS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
