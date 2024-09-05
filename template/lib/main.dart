import 'package:flutter/material.dart';
import '/page3.dart';


void main() {
  runApp(FasalForecastApp());
}

class FasalForecastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFD9F1C9), // Light green background
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
  
                
                // Logo at the top
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Image.asset(
                    'assets/icon.png',
                  // Replace with the actual image asset or URL
                    height: 150,
                  ),
                ),
                ),
                
                // Description text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Text(
                    'Empowering Farmers With AI-Based Disease Diagnosis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,

                      color: Color(0xFF024206),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                
                // Image placeholder
                Padding(
                  padding: const EdgeInsets.all(20.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/img1.png', // Replace with the actual image asset or URL
                    height: 239,
                    width:239,
                  ),
                ),
              ),
                
                // Get Started button
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child:SizedBox(
                    width:350,
                    height:65,
                    


                  
                  child: ElevatedButton(
                    

                    
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      
                      backgroundColor:Color(0xFF024206),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        
                      ),
                    ),
                    onPressed: () {
                      // Add navigation functionality here
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                       
                      ),
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}