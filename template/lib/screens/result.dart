import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async'; // Import for Future.delayed
import 'upload_photo.dart';
import 'front_page.dart';
import 'feedback.dart';
import 'about.dart';
import 'package:template/screens/reward_info.dart';
class Page10 extends StatelessWidget {
  const Page10({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FetchingDataScreen(), // Start with the fetching data screen
    );
  }
}

class FetchingDataScreen extends StatefulWidget {
  const FetchingDataScreen({super.key});

  @override
  _FetchingDataScreenState createState() => _FetchingDataScreenState();
}

class _FetchingDataScreenState extends State<FetchingDataScreen> {
  String diseaseLabel = "Fetching...";
  double confidence = 0.0;
  bool fetchCompleted = false;


  @override
  void initState() {
    super.initState();
    fetchPrediction();
    Future.delayed(const Duration(seconds: 6), () {
        showSeedAlertBox(context);
    });

  }

  // Function to fetch prediction from Flask backend
  Future<void> fetchPrediction() async {
    try {
      var dio = Dio();
      var response = await dio.get('http://10.0.2.2:5000/predict'); // Replace with your backend URL

      if (response.statusCode == 200) {
        setState(() {
          diseaseLabel = response.data['label'];
          confidence = response.data['confidence'];
          fetchCompleted = true; // Fetch is completed
        });
      } else {
        setState(() {
          diseaseLabel = "Error fetching results";
          fetchCompleted = true;
        });
      }
    } catch (e) {
      setState(() {
        diseaseLabel = "Error: ${e.toString()}";
        fetchCompleted = true;
      });
    }
  }

  // Function to show the seed alert box
  void showSeedAlertBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFFFFB81C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 520,  // Set a fixed height
            width: 350,   // Set a fixed width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/seed.png'),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  'CONGRATULATIONS!\nYOU WON A SEED',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF024206),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Keep uploading pictures and\ngrow a sapling',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF024206),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 100,  // Set the desired width
                  height: 60,  // Set the desired height
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF024206),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      // After closing the dialog, navigate to the result page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiseaseResultScreen(
                            diseaseLabel: diseaseLabel,
                            confidence: confidence,
                            isLoading: !fetchCompleted, // If fetch not completed, show loader
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFD9F1C9), // Background color
      body: Center(
        child: Container(
          height: 380,
          width: 320, // Width of the container
          padding: const EdgeInsets.all(20), // Padding inside the container
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50), // Margin around the container
          decoration: BoxDecoration(
            color: const Color(0xFFFFB81C), // Background color for the container
            borderRadius: BorderRadius.circular(15), // Rounded corners
            border: Border.all(
              color: Colors.black54,
              width: 2, // Border width
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26, // Shadow color
                blurRadius: 9, // Shadow blur
                offset: Offset(7, 10), // Shadow position
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Predicting...🤔🤔',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF024206), // Text color
                  ),
                  textAlign: TextAlign.center, // Align text to center
                ),
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                color: Color(0xFF024206),
              ), // Show loading indicator
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Fun Fact: Did you know plants can communicate through chemicals?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black, // Text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiseaseResultScreen extends StatefulWidget {
  final String diseaseLabel;
  final double confidence;
  final bool isLoading;


  const DiseaseResultScreen({
    super.key,
    required this.diseaseLabel,
    required this.confidence,
    required this.isLoading,
  });

  @override
  _DiseaseResultScreenState createState() => _DiseaseResultScreenState();
}

class _DiseaseResultScreenState extends State<DiseaseResultScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Icons.grass,
                size: 70,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: Container(

        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFE8F5E9),
        padding: const EdgeInsets.all(30),
        child: widget.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'RESULTS',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF024206),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB81C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      '88.24%',
                      style: const TextStyle(
                        color: Color(0xFF024206),
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'There is a 88.24% chance that your crops have Cotton Mealy Worms',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Container(
                        height: isExpanded ? 600 : 80, // Adjust height based on expansion
                        width: isExpanded ? 350 : 170, // Adjust width based on expansion
                        padding: EdgeInsets.all(isExpanded ? 1 :8), // Adjust padding based on expansion
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF024206), // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                            children: [
                              // Center "Learn More" text if expanded
                              Text(
                                'Learn More',
                                style: TextStyle(
                                  color: const Color(0xFFFFB81C),
                                  fontSize: isExpanded ? 30 : 18, // Adjust font size based on expansion
                                ),
                              ),
                              if (isExpanded) // Add your if condition here
                                const Padding(
                                  padding: EdgeInsets.all(10.0), // Add padding to the text
                                  child: Text(
                                    'Mealybugs are cottony in appearance, small oval, soft-bodied '
                                        'sucking insects. Adult mealybugs are found on leaves, stems '
                                        'and roots and are covered with white mealy wax, which makes '
                                        'them difficult to eradicate. They form colonies on stems and '
                                        'leaves developing into dense, waxy, white masses. '
                                        'They suck a large amount of sap from leaves and stems '
                                        'with the help of piercing/sucking mouth parts, depriving '
                                        'plants of essential nutrients. '
                                        'The excess sap is excreted as honeydew which attracts '
                                        'ants and develops sooty mould inhibiting the plant’s '
                                        'ability to manufacture food.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Treatments',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF024206),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Chemical Treatment',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF024206),
                      ),
                    ),
                    Text(
                      'Locate ant colonies and destroy them with drenching of chlorpyriphos '
                          '20 EC @ 2.5 ml/l or apply 5% malathion dust @ 25 kg/ha as the '
                          'ants provide them protection from parasitoids and predators and '
                          'also helps in spreading the crawlers to non-infested plants. '
                          'Spray dichlorvos 76 EC 2 ml/l, monocrotophos 36 WSC 1.5 ml/l, methyl demeton '
                          '25 EC 2 ml/l, chlorpyriphos 20 EC 2 ml/l, imidacloprid 200 SL 1ml/l or '
                          'malathion 2.5ml/l of water at 15 days intervals.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF024206),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Organic Treatment',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF024206),
                      ),
                    ),
                    Text(
                      'Use a plain jet of water to disrupt the bugs as they are feeding. '
                          'Then spray plants with neem oil to discourage the bugs from coming back. '
                          'Neem oil spray will not affect bees but kills mealybugs, '
                          'making it ideal for a pollinator-friendly landscape. '
                          'Kill mealybugs directly by wiping them with a cotton swab dipped in '
                          'rubbing alcohol.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF024206),
                      ),
                    ),
                  ],

                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 80, // Set desired height
                width: 210, // Set desired width
                padding: const EdgeInsets.all(10), // Set padding
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF024206), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page6(),
                      ),
                    );
                  },
                  child: const Text(
                    'Upload New Image',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Container(
                height: 80, // Set desired height
                width: 210, // Set desired width
                padding: const EdgeInsets.all(10), // Set padding
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF024206), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page12(),
                      ),
                    );
                  },
                  child: const Text(
                    'Feedback',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                    ),
                  ),
                ),
              )
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
void main(){
  runApp(const Page6());
}