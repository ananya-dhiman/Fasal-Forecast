import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure this package is included in pubspec.yaml
import 'translation_provider.dart'; // Import your TranslationProvider file
import 'about.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Translate Text',
      home: ChangeNotifierProvider(
        create: (_) => TranslationProvider(),
        child: TranslateScreen(),
      ),
    );
  }
}

class TranslateScreen extends StatefulWidget {
  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  String _selectedLanguage = 'en'; // Default to English

  @override
  Widget build(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFD9F1C9), // Light green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Image.asset(
                  'assets/icon.png',
                  // Replace with the actual image asset or URL
                  height: 150,
                ),
              ),
            ),
            // Simple text container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Text(
                translationProvider.translations['title'] ?? 'Choose Your Language',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20), // Added margin between the text and dropdown
            // Styled DropdownButton
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  width: 350,
                  height: 65,
                  padding: EdgeInsets.symmetric(vertical: 10.0), // Padding to center the text
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFEF), // Light grey background
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    items: [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'hi', child: Text('Hindi')),
                      DropdownMenuItem(value: 'kn', child: Text('Kannada')),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue ?? 'en';
                        translationProvider.changeLanguage(_selectedLanguage);
                      });
                    },
                    isExpanded: true, // Ensures dropdown expands to fill the width
                    underline: SizedBox(), // Removes the underline
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    dropdownColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Added margin between the dropdown and button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(
                width: 350,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    backgroundColor: Color(0xFF024206),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page3(selectedLanguage: _selectedLanguage),
                      ),
                    );
                  },
                  child: Text(
                    translationProvider.translations['getStartedButton'] ?? 'Get Started',
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
