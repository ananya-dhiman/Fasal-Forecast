import 'package:flutter/material.dart';
import 'screens/front_page.dart';
import 'screens/about.dart';
import 'screens/preview_and_info.dart';
import 'camera.dart';

void main() {
  runApp(MyCropApp());
}

class MyCropApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fasal Forecast',
      debugShowCheckedModeBanner: false, 
      initialRoute: '/front_page',
      routes: {
        '/front_page': (context) => Page1(),
        '/about': (context) => Page3(selectedLanguage: 'en'),
        '/preview_and_info': (context) => Page4(),
        '/camera':(context) => Page5(),
      },
    );
  }
}
