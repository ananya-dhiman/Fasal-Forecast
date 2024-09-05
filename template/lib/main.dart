import 'package:flutter/material.dart';
import 'screens/front_page.dart';
import 'screens/about.dart';
import 'screens/preview_and_info.dart';

void main() {
  runApp(MyCropApp());
}

class MyCropApp extends StatelessWidget { // Corrected the typo here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fasal Forecast',
      debugShowCheckedModeBanner: false, 
      initialRoute: '/front_page', // Updated to match one of the route keys
      routes: {
        '/front_page': (context) => Page1(), // Removed '/screens/' prefix
        '/about': (context) => Page3(),
        '/preview_and_info': (context) => Page4(),
      },
    );
  }
}
