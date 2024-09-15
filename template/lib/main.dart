import 'package:flutter/material.dart';
import 'screens/front_page.dart';
import 'screens/about.dart';
import 'screens/preview_and_info.dart';
import 'camera.dart';
import 'screens/translate-ui.dart';
import 'screens/result.dart';


void main() {
  runApp(const MyCropApp());
}

class MyCropApp extends StatelessWidget {
  const MyCropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fasal Forecast',
      debugShowCheckedModeBanner: false, 
      initialRoute: '/front_page',
      routes: {
        '/front_page': (context) => const Page1(),
        '/translate_ui':(context) => const Page2(),
        '/about': (context) => const Page3(),
        '/preview_and_info': (context) => const Page4(),
        '/camera':(context) => const Page5(),
        '/result':(context)=> const Page7(),
      },
    );
  }
}
