import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:template/translate-ui.dart';
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
  void translateText(String input,String languageCode) {
    translator.translate(input, to: languageCode).then((result) {
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
      ),
    );
  }
}
