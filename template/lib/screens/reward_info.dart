import 'package:flutter/material.dart';
import './about.dart';
import './upload_photo.dart';
import './front_page.dart';
import './feedback.dart';
import './result.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page13(),  // Wrap your GrowthPage here
      debugShowCheckedModeBanner: false,  // Optional: Hide the debug banner
    );
  }
}

class Page13 extends StatefulWidget {
  @override
  _GrowthPageState createState() => _GrowthPageState();
}

class _GrowthPageState extends State<Page13> {
  double _uploadedPictures = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFDFF7CB) ,
    resizeToAvoidBottomInset : false,
      drawer: _buildEndDrawer(context),

      appBar: AppBar(
        leading: Align(
          alignment: Alignment.topLeft, // Aligns the icon to the top-left
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.perm_identity_sharp,
                size: 40,
                color: Color(0xFFFFB81C),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open drawer when icon is pressed
              },
            ),
          ),
        ),
        toolbarHeight: 200,
        backgroundColor: const Color(0xFF024206),
        automaticallyImplyLeading: false,
        flexibleSpace: const Stack(
          fit: StackFit.expand,
          children: [
            // Centered grass icon
            Center(
              child: Icon(
                Icons.military_tech,
                size: 70,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'NUMBER OF SEEDS: 1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF024206),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'NUMBER OF PLANTS: 0',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF024206),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                 
                  Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Space before slider
                  const Spacer(),
                  
                  // Rotated Slider positioned in the middle of the screen
                  SizedBox(
                    height: 600, // Height for the slider
                    child: Transform.rotate(
                      angle: -3.14159 / 2, // Rotate the slider by 90 degrees
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 5.0, // Increase the track height
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
                        ),
                        child: Transform.scale(
                          scale: 2.7,
                          child: Slider(
                            value: _uploadedPictures,
                            min: 1,
                            max: 10,
                            divisions: 2,
                            activeColor: Color(0xFFFFB81C),
                            inactiveColor: Colors.grey[300],
                            onChanged: (value) {
                              setState(() {
                                _uploadedPictures = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
             // Images and Slider
                  Expanded(
                    child: Column(
                      children: [
                       const Spacer(),
                        Image.asset('assets/plant.png', height: 120,width:120),
                        const Spacer(),
                        Image.asset('assets/sap.png', height: 80,width:80),
                        const Spacer(),
                        Image.asset('assets/seed.png', height: 80,width:80),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Center(
              child: Icon(
                Icons.lightbulb_outline,
                size: 50,
                color: Color(0xFFFFB81C),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'KEEP UPLOADING PICTURES AND GROW A PLANT',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16,color:  Color(0xFF024206),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page10()), //Navigate to Page5
                 );
                // Results button pressed
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor:const Color(0xFF024206),
              ),
              
              child: const Text(
                'RESULTS',
                style: TextStyle(fontSize: 18,color:Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

 
 Drawer _buildEndDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer header
          const UserAccountsDrawerHeader(
            accountName:  Text("Sarthak"),
            accountEmail:  Text("sarthakk20@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor:  Color(0xFFFFB81C),
              child: Text(
                "S",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF024206), // Background color
            ),
          ),
          // Drawer items
          ListTile(
            leading: const Icon(Icons.history, color: Color(0xFFFFB81C),),
            title: const Text('Result History'),
          
            onTap: () {
               Navigator.push(
                context,
                      MaterialPageRoute(
                        builder: (context) => const Page5(),//Aboutt
                      ),
                    );

              // Navigate or handle tap here
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events, color:Color(0xFFFFB81C),),
            title: const Text('Rewards'),
           onTap: () {
               Navigator.push(
                context,
                      MaterialPageRoute(
                        builder: (context) => Page13(),//Reward List
                      ),
                    );

              // Navigate or handle tap here
            },
          ),
          ListTile(
            leading: const Icon(Icons.upload_file, color:Color(0xFFFFB81C)),
            title: const Text('Upload'),
             onTap: () {
               Navigator.push(
                context,
                      MaterialPageRoute(
                        builder: (context) => const Page6(),//Upload
                      ),
                    );

              // Navigate or handle tap here
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Color(0xFFFFB81C)),
            title: const Text('Help'),
             onTap: () {
               Navigator.push(
                context,
                      MaterialPageRoute(
                        builder: (context) => const Page5(),//About
                      ),
                    );

              // Navigate or handle tap here
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback, color: Color(0xFFFFB81C)),
            title: const Text('Feedback'),
             onTap: () {
               Navigator.push(
                context,
                      MaterialPageRoute(
                        builder: (context) => const Page12(),//Feedback
                      ),
                    );

              // Navigate or handle tap here
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFFFFB81C)),
            title: const Text('Logout'),
             onTap: () {
               Navigator.push(
                context,
                      MaterialPageRoute(
                        builder: (context) => const Page1(),//Logout
                      ),
                    );

              // Navigate or handle tap here
            },
          ),
        ],
      ),
    );
  }

