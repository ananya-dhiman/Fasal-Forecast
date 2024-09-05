import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'translation_provider.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: translationProvider.currentLanguage,
          items: const [
            DropdownMenuItem(value: 'en', child: Text('English')),
            DropdownMenuItem(value: 'hi', child: Text('Hindi')),
            DropdownMenuItem(value: 'kn', child: Text('Kannada')),
          ],
          onChanged: (String? newLanguage) {
            if (newLanguage != null) {
              translationProvider.changeLanguage(newLanguage);
            }
          },
        ),
      ),
    );
  }
}
