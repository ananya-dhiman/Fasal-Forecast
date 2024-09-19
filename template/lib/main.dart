import 'package:flutter/material.dart';
import 'screens/front_page.dart';
import 'screens/about.dart';
import 'screens/upload_photo.dart';
import 'camera.dart';
import 'screens/translate-ui.dart';
import 'screens/result.dart';
import 'screens/signup.dart';
import 'screens/error.dart';
import 'screens/login.dart';
import 'screens/feedback.dart';
import 'screens/reward_info.dart';


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
        '/signup': (context) => const Page3(),
        '/login': (context) => const Page4(),
        '/about': (context) => const Page5(),
        '/upload_photo': (context) => const Page6(),
        '/camera':(context) => const Page7(),
        '/result':(context)=> const Page10(),
        // '/seed_reward':(context)=> const Page9(),
        //'/water_reward':(context)=> const Page12(),
        '/error':(context)=> const Page11(),
        '/feedback':(context)=> const Page12(),
        '/reward_info':(context)=>  Page13(),
      },
    );
  }
}
