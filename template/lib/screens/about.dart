import 'package:flutter/material.dart';
import 'translate_function.dart';
import 'upload_photo.dart';
import 'front_page.dart';
import 'feedback.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StickyHeaderExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StickyHeaderExample extends StatefulWidget {
  const StickyHeaderExample({super.key});

  @override
  _StickyHeaderExampleState createState() => _StickyHeaderExampleState();
}

class _StickyHeaderExampleState extends State<StickyHeaderExample> {
  // Local state variables for translated texts
  String startNowText = 'Start Now';
  String howItWorksText = 'HOW IT WORKS';
  String snapText = 'Snap';
  String snapDescriptionText = 'Take a photo of your crops';
  String shareText = 'Share';
  String shareDescriptionText = 'Add your location and send the photo';
  String checkText = 'Check';
  String checkDescriptionText = 'Get instant results with solutions';
  String doText = 'Do';
  String doDescriptionText = 'Follow the steps to treat and protect your farm';
  String aboutText = 'ABOUT';
  String aboutDescriptionText1 = 'At Fasal Forecast, we\'re committed to helping farmers protect their crops and boost their yields with advanced technology. Our AI-driven Crop Disease Prediction uses the latest machine learning to analyze crop images and environmental data, giving you fast and accurate disease detection.';
  String aboutDescriptionText2 = 'We know crop diseases can be unpredictable and costly. That’s why we’re here to support you in overcoming these challenges. Join us in our mission to make farming more productive and sustainable. Together, we can build a brighter future for agriculture.';

  @override
  void initState() {
    super.initState();
    _initializeTranslations(); // Initialize translations on state creation
  }

  Future<void> _initializeTranslations() async {
    // Translate all texts based on the preset language
    startNowText = await translateText('Start Now');
    howItWorksText = await translateText('HOW IT WORKS');
    snapText = await translateText('Snap');
    snapDescriptionText = await translateText('Take a photo of your crops');
    shareText = await translateText('Share');
    shareDescriptionText = await translateText('Add your location and send the photo');
    checkText = await translateText('Check');
    checkDescriptionText = await translateText('Get instant results with solutions');
    doText = await translateText('Do');
    doDescriptionText = await translateText('Follow the steps to treat and protect your farm');
    aboutText = await translateText('ABOUT');
    aboutDescriptionText1 = await translateText('At Fasal Forecast, we\'re committed to helping farmers protect their crops and boost their yields with advanced technology. Our AI-driven Crop Disease Prediction uses the latest machine learning to analyze crop images and environmental data, giving you fast and accurate disease detection.');
    aboutDescriptionText2 = await translateText('We know crop diseases can be unpredictable and costly. That’s why we’re here to support you in overcoming these challenges. Join us in our mission to make farming more productive and sustainable. Together, we can build a brighter future for agriculture.');

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Clean up resources or subscriptions if necessary
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: _buildEndDrawer(context), // Drawer appears here in the same Scaffold
      backgroundColor: const Color(0xFFDFF7CB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
          leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.perm_identity_sharp,size: 40,color: Color(0xFFFFB81C)),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when icon is pressed
            },
          ),
    ),
            pinned: true,
            expandedHeight: 300.0,
            backgroundColor: const Color(0xFF024206),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(10),
              centerTitle: true,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.grass,
                    size: 90,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFB81C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                       
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page6(), // Make sure Page6 is defined and imported
                            ),
                            );
                          

                      },
                      child: Text(
                        startNowText,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Color(0xFF024206),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildHowItWorksSection(context),
                _buildImageSection(),
                _buildAboutSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFDFF7CB),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              howItWorksText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF024206),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildStep(Icons.camera_alt, snapText, snapDescriptionText),
            const SizedBox(height: 30),
            _buildStep(Icons.location_on, shareText, shareDescriptionText),
            const SizedBox(height: 30),
            _buildStep(Icons.check_box, checkText, checkDescriptionText),
            const SizedBox(height: 30),
            _buildStep(Icons.eco, doText, doDescriptionText),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(IconData icon, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: const Color(0xFF024206)),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF024206),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 30.0),
        child: Image.asset(
          'assets/img2.png',
          height: 239,
          width: 239,
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFDFF7CB),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              aboutText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF024206),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              aboutDescriptionText1,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              aboutDescriptionText2,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
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
                        builder: (context) => const Page5(),//About
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

