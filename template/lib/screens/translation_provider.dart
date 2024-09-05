import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TranslationProvider with ChangeNotifier {
  Map<String, String> translations = {
    'title': 'Choose Your Language',
    'getStartedButton': 'Get Started',
  };

  String currentLanguage = 'en'; // Default language

  final String apiUrl = 'https://translated-mymemory---translation-memory.p.rapidapi.com/get';
  final String apiKey = 'b847d49f3emshe75cd49ad91e1b5p1fe7b4jsn316abbc265ee';

  void changeLanguage(String languageCode) {
    currentLanguage = languageCode;
    fetchTranslations();
  }

  Future<void> fetchTranslations() async {
    Map<String, String> newTranslations = {};

    for (var key in translations.keys) {
      final response = await http.get(
        Uri.parse('$apiUrl?langpair=en|$currentLanguage&q=${Uri.encodeComponent(translations[key]!)}&mt=1&onlyprivate=0&de=a@b.c'),
        headers: {
          'x-rapidapi-host': 'translated-mymemory---translation-memory.p.rapidapi.com',
          'x-rapidapi-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final translatedText = jsonResponse['responseData']['translatedText'];
        newTranslations[key] = translatedText ?? translations[key]!;
      } else {
        newTranslations[key] = translations[key]!;
      }
    }

    translations = newTranslations;
    notifyListeners();
  }
}
