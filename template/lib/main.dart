import 'package:flutter/material.dart';
import 'screens/front_page.dart';
import 'screens/about.dart';
import 'screens/upload_photo.dart';
import 'camera.dart';
import 'screens/translate-ui.dart';
import 'screens/result.dart';
import 'screens/signup.dart';
<<<<<<< HEAD
import 'screens/seed_reward.dart';
import 'screens/error.dart';
=======
import 'screens/login.dart';
>>>>>>> c862f27a0de0a12a2c935160e3bf8fbec3e251c0


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
      initialRoute: '/seed_reward',
      routes: {
        '/front_page': (context) => const Page1(),
        '/translate_ui':(context) => const Page2(),
        '/signup': (context) => const Page3(),
        '/login': (context) => const Page4(),
        '/about': (context) => const Page5(),
        '/upload_photo': (context) => const Page6(),
        '/camera':(context) => const Page7(),
<<<<<<< HEAD
        '/error':(context)=> const Page8(),
        '/seed_reward': (context) => const Page9(),
        '/result':(context)=> const Page10(),
=======
        '/result':(context)=> const Page8(),
        //'/seed_reward':(context)=> const Page9(),
        //'/water_reward':(context)=> const Page10(),
        //'/error':(context)=> const Page11(),
>>>>>>> c862f27a0de0a12a2c935160e3bf8fbec3e251c0
        

      },
    );
  }
}
