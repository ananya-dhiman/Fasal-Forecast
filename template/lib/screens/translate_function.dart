// translate_function.dart
import 'package:translator/translator.dart';
import 'global.dart';

final GoogleTranslator translator = GoogleTranslator();

Future<String> translateText(String text) async {
  final translation = await translator.translate(text, to: selectedLanguage);
  return translation.text;
}
