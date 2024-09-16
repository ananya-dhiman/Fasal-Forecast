import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Page7 extends StatelessWidget {
  const Page7({super.key});

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
  }

  // Function to fetch prediction from Flask backend
  Future<void> fetchPrediction() async {
    try {
      var dio = Dio();
      var response = await dio.get('http://10.0.2.2:5000/predict');  // Replace with your backend URL

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF024206),
        elevation: 0,
        title: const Icon(
          Icons.grass,
          color: Color(0xFFFFB81C),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green[100],
        padding: const EdgeInsets.all(45),
        child: isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
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
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
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
          ],
        ),
      ),
    );
  }
}
