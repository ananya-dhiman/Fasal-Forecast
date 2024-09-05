import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(Tralang());
}

class Tralang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TranslationScreen(),
    );
  }
}

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final GoogleTranslator translator = GoogleTranslator(); // Create an instance of the translator
  String translatedText = ""; // Variable to store the translated text

  // Function to translate text to a specified language
  void translateText(String languageCode) {
    translator.translate("hello", to: languageCode).then((result) {
      setState(() {
        translatedText = result.text; // Set the translated text
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Translator"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Original Text: "hello"',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20), // Adds space between the widgets
            Text(
              'Translated Text: $translatedText',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => translateText('hi'), // Translate to Hindi
                  child: Text('Translate to Hindi'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => translateText('kn'), // Translate to Kannada
                  child: Text('Translate to Kannada'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
