import 'package:flutter/material.dart';
import 'package:template/screens/login.dart';
import 'global.dart';



class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFD9F1C9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 40.0),
                child: Image.asset(
                  'assets/icon.png',
                  height: 150,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Text(
                'Choose Your Language',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  width: 350,
                  height: 65,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    value: selectedLanguage,
                    items: const [
                      DropdownMenuItem(value: 'en', child: Text('English',textAlign: TextAlign.center,)),
                      DropdownMenuItem(value: 'hi', child: Text('Hindi',textAlign: TextAlign.center,)),
                      DropdownMenuItem(value: 'kn', child: Text('Kannada',textAlign: TextAlign.center,)),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue ?? 'en';
                      });
                    },
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    dropdownColor: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(
                width: 350,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    backgroundColor: const Color(0xFF024206),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page4(),//Login
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
