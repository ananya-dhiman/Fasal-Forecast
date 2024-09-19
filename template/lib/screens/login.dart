import 'package:flutter/material.dart';
import './about.dart';
import 'signup.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page4(),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  color: const Color(0xFFDFF7CB),  // Set background to the desired color
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(), // Add space at the top to help center the login box

                      const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF024206),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB81C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "johndoe@gmail.com",
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Enter Password",
                                hintText: "Enter password",
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Page5()), //Navigate to Page5
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
                                  "Log In",
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Color(0xFF024206),
                              fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // "Have an account?" text
                      const Text(
                        "DON'T HAVE AN ACCOUNT?",
                        style: TextStyle(
                          color: Color(0xFF024206),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Page3()), //Login
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF024206),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      const Spacer(), // Add space at the bottom to keep the content centered
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
