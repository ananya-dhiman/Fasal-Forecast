import 'package:flutter/material.dart';
import 'package:template/camera.dart';
import 'translate_function.dart'; // Import the translation function

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Local state variables for translated texts
  String locationText = 'Location';
  String bilzenText = 'Bilzen, Tanjungbalai';
  String previewText = 'Upload Images to Get Result';
  String uploadText = 'Upload Picture';
  String takePictureText = 'Take A Picture';

  @override
  void initState() {
    super.initState();
    _initializeTranslations(); // Initialize translations on state creation
  }

  Future<void> _initializeTranslations() async {
    // Translate all texts based on the preset language
    locationText = await translateText('Location');
    bilzenText = await translateText('Bilzen, Tanjungbalai');
    previewText = await translateText('Preview');
    uploadText = await translateText('Upload Picture');
    takePictureText = await translateText('Take A Picture');

    if (mounted) { // Check if the widget is still mounted before calling setState
      setState(() {}); // Update the state to reflect translations
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF024206),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.grass,
            color: Colors.orangeAccent,
          ),
          
        ),
      ),
      body: Container(
        color: Colors.green[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              locationText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              bilzenText,
              style: TextStyle(fontSize: 20, color: Color(0xFF024206)),
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
              child: Center(
                child: Text(
                  previewText,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // API INTEGRATION HERE
                    },
                    icon: const Icon(
                      Icons.upload,
                      color: Colors.white,
                    ),
                    label: Text(
                      uploadText,
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF024206),
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Page5(), // Correctly navigate to Page5
                        ),
                      );
                      // Add your take a picture function here
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    label: Text(
                      takePictureText,
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF024206),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
