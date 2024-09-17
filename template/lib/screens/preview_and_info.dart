import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // Import Dio package
import 'package:image_picker/image_picker.dart'; // Import image picker package
import 'package:path/path.dart';
import 'package:template/camera.dart';
import 'translate_function.dart'; // Import the translation function
import 'package:template/screens/result.dart';
import './about.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? humidity;
  double? tempMax;
  double? tempMin;
  double? windSpeed;
  String? region;
  String? city;
  String previewText = 'Upload Images to Get Result';
  String uploadText = 'Upload Picture';
  String takePictureText = 'Take A Picture';
  File? _image; // Local state to store the selected image
  Dio dio = Dio(); // Create Dio instance

  @override
  void initState() {
    super.initState();
    _initializeTranslations(); // Initialize translations on state creation
  }

  Future<void> _initializeTranslations() async {
    try {
      final response = await dio.get('http://10.0.2.2:5000/envdata');

      if (response.statusCode == 200) {
        final data = response.data;

        setState(() {
          humidity = data['humidity']?.toDouble();
          tempMax = data['temp_max']?.toDouble();
          tempMin = data['temp_min']?.toDouble();
          windSpeed = data['wind_speed']?.toDouble();
          city = data['city'];
          region = data['region'];
        });

        // Translate all texts based on the preset language
        previewText = await translateText('Preview');
        uploadText = await translateText('Upload Picture');
        takePictureText = await translateText('Take A Picture');

        setState(() {});
      }
    } catch (e) {
      print('Error fetching environmental data: $e');
    }
  }

  // Function to show alert dialog when no image is provided
  void showNoImageAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("No Image Provided"),
          content: const Text("Please upload or take a picture to continue."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        previewText = 'Image selected';
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      print('No image to upload'); // Call the alert dialog if no image is provided
      return;
    }

    try {
      String fileName = basename(_image!.path);
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(_image!.path, filename: fileName),
      });

      Response response = await dio.post("http://10.0.2.2:5000/upload", data: formData);

      if (response.statusCode == 200) {
        setState(() {
          previewText = 'Image uploaded successfully';
        });
      } else {
        setState(() {
          previewText = 'Image upload failed';
        });
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Page3()), // Directly navigate to the Page3 (About page)
    );
     return false;// Allow the back button to work as expected
    },
      child:Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF024206),
        elevation: 0,
     
          title:const Center(
          child: Padding(
      padding: EdgeInsets.all(0),
          
          child: Icon(
            Icons.grass,
            color: Colors.orangeAccent,
          ),
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
            Text(
              city != null && region != null ? 'Location: $city, $region' : 'Loading location details....',
              style: TextStyle(fontSize: 23, color: Colors.green[900], fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
              child: Center(
                child: _image == null
                    ? Text(
                  previewText,
                  style: const TextStyle(fontSize: 18),
                )
                    : Image.file(_image!),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage, // Pick an image from gallery
                    icon: const Icon(
                      Icons.photo_library,
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
                    onPressed:() {
                      _uploadImage();
                      if (_image != null)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page7(), // Correctly navigate to Page5
                          ),
                        );
                      else
                        showNoImageAlertDialog(context); // Show alert if no image is selected
                    },// Upload the selected image
                    icon: const Icon(
                      Icons.upload,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Upload Image',
                      style: TextStyle(color: Colors.white),
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
                          builder: (context) => const Page5(), // Correctly navigate to Page5
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
    ),
    );
  }
}
