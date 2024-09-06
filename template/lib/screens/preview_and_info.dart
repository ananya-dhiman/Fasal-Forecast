import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // Import Dio package
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
  double? humidity;
  double? tempMax;
  double? tempMin;
  double? windSpeed;
  String previewText = 'Upload Images to Get Result';
  String uploadText = 'Upload Picture';
  String takePictureText = 'Take A Picture';

  Dio dio = Dio(); // Create Dio instance

  @override
  void initState() {
    super.initState();
    _initializeTranslations(); // Initialize translations on state creation
  }

  Future<void> _initializeTranslations() async {
    try {
      // Use '10.0.2.2' to connect to the host machine when using the Android emulator
      final response = await dio.get('http://10.0.2.2:5000/envdata');

      if (response.statusCode == 200) {
        // Decode the response body
        final data = response.data;
        print(data);

        // Update state with the fetched data
        setState(() {
          humidity = data['humidity']?.toDouble();
          tempMax = data['temp_max']?.toDouble();
          tempMin = data['temp_min']?.toDouble();
          windSpeed = data['wind_speed']?.toDouble();
        });

        // Translate all texts based on the preset language
        previewText = await translateText('Preview');
        uploadText = await translateText('Upload Picture');
        takePictureText = await translateText('Take A Picture');

        // Update the translated text into the state
        setState(() {
          previewText = previewText;
          uploadText = uploadText;
          takePictureText = takePictureText;
        });
      }
    } catch (e) {
      print('Error fetching environmental data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
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
              humidity != null ? 'Humidity: $humidity%' : 'Loading humidity...',
              style: TextStyle(fontSize: 20, color: Colors.green[900]),
            ),
            Text(
              tempMax != null ? 'Max Temp: $tempMax°C' : 'Loading max temp...',
              style: TextStyle(fontSize: 20, color: Colors.green[900]),
            ),
            Text(
              tempMin != null ? 'Min Temp: $tempMin°C' : 'Loading min temp...',
              style: TextStyle(fontSize: 20, color: Colors.green[900]),
            ),
            Text(
              windSpeed != null ? 'Wind Speed: $windSpeed m/s' : 'Loading wind speed...',
              style: TextStyle(fontSize: 20, color: Colors.green[900]),
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
                      backgroundColor: const Color(0xFF024206),
                      minimumSize: const Size(double.infinity, 50),
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
                      backgroundColor: const Color(0xFF024206),
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
