import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      body: Container(
        color: Colors.lightGreen[100], // Light green background
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top logo/icon
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: const Center(
                child: Icon(
                  Icons.grain, // Example icon
                  size: 50,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Sign up text
            Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            SizedBox(height: 20),

            // Form container with email and password
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
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
                    ),
                  ),
                  SizedBox(height: 20),

                  // Password field
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Sign In button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child:const  Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Forgot password link
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot password?",
                style: TextStyle(color: Colors.orange[800]),
              ),
            ),
            const SizedBox(height: 20),

            // Login button for users with an account
            const Text("HAVE AN ACCOUNT?"),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[800],
         
              ),
              child:const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
