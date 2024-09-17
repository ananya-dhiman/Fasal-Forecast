import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async'; // Import for Future.delayed
import 'package:template/screens/upload_photo.dart';

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
    Future.delayed(const Duration(seconds: 7), () {
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
            height: 480,  // Set a fixed height
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
                    fontSize: 24,
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
          height: 400,
          width: 300, // Width of the container
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
                blurRadius: 10, // Shadow blur
                offset: Offset(0, 5), // Shadow position
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(), // Show loading indicator
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Making prediction...🤔🤔',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF024206), // Text color
                  ),
                  textAlign: TextAlign.center, // Align text to center
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Fun Fact: Did you know plants can communicate through chemicals?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black54, // Text color
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: const Color(0xFF024206),
        automaticallyImplyLeading: false,
        flexibleSpace: const Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Icon(
                Icons.grass,
                size: 90,
                color: Colors.orange,
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Icon(
                Icons.perm_identity_sharp,
                size: 60,
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
                    Text(
                      '${widget.confidence.toStringAsFixed(2)}%',
                      style: const TextStyle(
                        color: Color(0xFF024206),
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'There is a ${widget.confidence.toStringAsFixed(2)}% chance that your crops have ${widget.diseaseLabel}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFF024206), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // Define what happens when Learn More is clicked
                      },
                      child: const Text(
                        'Learn More',
                        style: TextStyle(
                          color: Color(0xFFFFB81C),
                        ),
                      ),
                    ),
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF024206),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Chemical',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF024206),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Organic',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF024206),
                      ),
                    ),
                  ],

                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 100, // Set desired height
                width: 240, // Set desired width
                padding: const EdgeInsets.all(10), // Set padding
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF024206), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
                    'Upload a new picture',
                    style: TextStyle(
                      fontSize: 18,
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
