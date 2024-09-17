import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:template/screens/upload_photo.dart';

class Page10 extends StatelessWidget {
  const Page10({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiseaseResultScreen(),
    );
  }
}

class DiseaseResultScreen extends StatefulWidget {
  const DiseaseResultScreen({super.key});

  @override
  _DiseaseResultScreenState createState() => _DiseaseResultScreenState();
}

class _DiseaseResultScreenState extends State<DiseaseResultScreen> {
  String diseaseLabel = "Fetching...";
  double confidence = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrediction();
    // Automatically call the dialog when the page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
          isLoading = false;
        });
      } else {
        setState(() {
          diseaseLabel = "Error fetching results";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        diseaseLabel = "Error: ${e.toString()}";
        isLoading = false;
      });
    }
  }

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
            child: Center(
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
          ),
        );
      },
    );
  }

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
        child: isLoading
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
                      '${confidence.toStringAsFixed(2)}%',
                      style: const TextStyle(
                        color: Color(0xFF024206),
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'There is a ${confidence.toStringAsFixed(2)}% chance that your crops have $diseaseLabel',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF024206), // Button color
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
              const SizedBox(height: 30),
              SizedBox(
                height: 50, // Set the desired height here
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page6(), // Replace with your page
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF024206), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Upload another Picture',
                    style: TextStyle(
                      color: Color(0xFFFFB81C),
                    ),
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

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Picture'),
      ),
      body: const Center(
        child: Text('This is the upload page'),
      ),
    );
  }
}
