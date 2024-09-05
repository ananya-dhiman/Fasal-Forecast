import 'package:flutter/material.dart';


class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StickyHeaderExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StickyHeaderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF7CB),
      
      body: CustomScrollView(
        
        slivers: [
          // The sticky green header (SliverAppBar)
         SliverAppBar(
  pinned: true, // Keeps the header sticky
  floating: false, // Allows the app bar to be displayed at the top of the screen
  snap: false, // Prevents the app bar from snapping into view
  expandedHeight: 150.0, // Height when expanded
  backgroundColor: const Color(0xFF024206), // Green background
  flexibleSpace: FlexibleSpaceBar(
    titlePadding: const EdgeInsets.all(10),
    centerTitle: true,
    background: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Your widgets here...
      ],
    ),
  ),
),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // "How It Works" section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:const Color(0xFFDFF7CB), // Light green background
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'HOW IT WORKS',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF024206)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),

                        // Step 1: Snap
                        Icon(Icons.camera_alt, size: 50, color: Color(0xFF024206)),
                        SizedBox(height: 10),
                        Text(
                          'Snap',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF024206),
                          ),
                            textAlign: TextAlign.center,
                        ),
                        Text('Take a photo of your crops',
                        textAlign: TextAlign.center,
                          ),

                        SizedBox(height: 30),

                        // Step 2: Share
                        Icon(Icons.location_on, size: 50, color: Color(0xFF024206)),
                        SizedBox(height: 10),
                        Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF024206),
                          ),
                            textAlign: TextAlign.center,
                        ),
                        Text('Add your location and send the photo',
                          textAlign: TextAlign.center,
                          ),

                        SizedBox(height: 30),

                        // Step 3: Check
                        Icon(Icons.check_box, size: 50, color:Color(0xFF024206)),
                        SizedBox(height: 10),
                        Text(
                          'Check',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF024206),
                          ),
                        ),
                        Text('Get instant results with solutions',
                        textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 30),

                        // Step 4: Do
                        Icon(Icons.eco, size: 50, color: Color(0xFF024206)),
                        SizedBox(height: 10),
                        Text(
                          'Do',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF024206),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text('Follow the steps to treat and protect your farm',
                        textAlign: TextAlign.center,
                        ),
                        
                      ],
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/img2.png', // Replace with the actual image asset or URL
                    height: 239,
                    width:239,
                  ),
                ),
              ),
         
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:const Color(0xFFDFF7CB), // Light green background
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ABOUT',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF024206)
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),

          
                       
                        
                        Text('At Fasal Forecast, we\'re committed to helping farmers protect their crops and boost their yields with advanced technology. Our AI-driven Crop Disease Prediction  uses the latest machine learning to analyze crop images and environmental data, giving you fast and accurate disease detection.',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                           
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Text('We know crop diseases can be unpredictable and costly. That\’s why we\'re here to support you in overcoming these challenges. Join us in our mission to make farming more productive and sustainable. Together, we can build a brighter future for agriculture.',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                           
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
