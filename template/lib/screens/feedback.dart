import 'package:flutter/material.dart';
import './about.dart';
import './upload_photo.dart';
import './front_page.dart';
void main() {
  runApp(const Page12());
}

class Page12 extends StatelessWidget {
  const Page12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedback Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
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
                Icons.grass,
                size: 90,
                color: Colors.orange,
              ),
            ),
            // Positioned bottom-right icon
            
          ],
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Top Section
    // Rest of the Body
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Text(
            'FEEDBACK',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[900],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFFFB81C),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title of the problem',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      borderSide: const BorderSide(
                        color: Colors.grey, // Default border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Border color when focused
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      borderSide: const BorderSide(
                        color: Colors.grey, // Default border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:const  BorderSide(
                        color: Colors.grey, // Border color when focused
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Page5()), // About
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF024206), // button background color
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
               ),
            ),
            child: const Text(
              'SUBMIT',
              style: TextStyle(
                color: Colors.white, // text color
                fontSize: 18, // text size
                fontWeight: FontWeight.bold, // bold text
                letterSpacing: 2.0, // spacing between letters
              ),
            ),
          ),
        ],
      ),
    ),
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
              //  Navigator.push(
              //   context,
              //         MaterialPageRoute(
              //           builder: (context) => const Page13(),//Reward List
              //         ),
              //       );

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

