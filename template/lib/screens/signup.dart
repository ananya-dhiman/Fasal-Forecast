import 'package:flutter/material.dart';
import './login.dart';
import './about.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page3(),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        backgroundColor: const Color(0xFF024206),
        toolbarHeight: 200.0, // Set the height of the AppBar
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.grass,
              color: Colors.orange,
              size: 70.0, // You can adjust the size of the icon as needed
            ),
          ],
        ),
      ),

      body: Container(
        color: const Color(0xFFDFF7CB), // Light green background
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sign up text
            const Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF024206),
              ),
            ),
            const SizedBox(height: 20),
            // Form container with email and password
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFB81C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Email field
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "johndoe@gmail.com",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white, // Set background to white
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password field
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white, // Set background to white
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Confirm password",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign In button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Page4()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF024206),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Login button for users with an account
            const Text(
              "HAVE AN ACCOUNT?",
              style: TextStyle(
                  color: Color(0xFF024206),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page4()), //L
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF024206),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page5()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF024206),
              ),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
            )

          ],
        ),
      ),
    );
  }
}
