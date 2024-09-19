import 'package:flutter/material.dart';
import './upload_photo.dart';
import './about.dart';
import './front_page.dart';
import './reward_info.dart';
import './feedback.dart';

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFB81C), 
         resizeToAvoidBottomInset : false,
      drawer: _buildEndDrawer(context),
      
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.perm_identity_sharp,size: 40,color: Color(0xFFFFB81C)),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when icon is pressed
            },
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
                Icons.dangerous,
                size: 80,
                color: Colors.orange,
              ),
            ),
            // Positioned bottom-right icon
            
          ],
        ),
      ),// Background color
        body: SingleChildScrollView( // Wrap content in a scroll view
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              

              // Central part of the page with image and error message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/tree.png', // Add your image path here
                      height: 450, // Adjust as needed
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ERROR!\nTHE IMAGE YOU GAVE US\nWAS NOT OF A CROP OR PLANT.\nPLEASE TRY AGAIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF024206),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        // Define the action for Try Again button
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Page6()), // Navigate to Page6
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF024206), // Button color
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Try Again',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                        builder: (context) =>  Page13(),//Reward List
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

