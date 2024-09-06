import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:template/screens/result.dart';

class Page5 extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<Page5> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    _setupCameras();
  }

  Future<void> _setupCameras() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras[0], // Use the back camera
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture; // Ensure the camera is initialized
      final image = await _controller!.takePicture();
      //The Image validator should go here
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePreviewScreen(imagePath: image.path, onRetake: _retakePhoto),
          ),
       
        );
    



      }
     catch (e) {
      print(e);
    }
      Future<void> _uploadImage(String imagePath) async {
    final uri = Uri.parse('localhost:5000');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', imagePath));

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image');
    }
  }

  }

  void _retakePhoto() {
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: Text('Take a Picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller!); // Display camera preview
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: _takePicture,
      ),
    );
  }
}

// Image Preview Screen
class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRetake;

  const ImagePreviewScreen({required this.imagePath, required this.onRetake});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9F1C9),
      appBar: AppBar(
        title: const Text(
          'Upload Image To Get Results',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFF024206),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the captured image
            Image.file(File(imagePath), height: 400, fit: BoxFit.cover),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Retake Photo Button
                Container(
                 padding:const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(1.0),
                      backgroundColor: const Color(0xFF024206),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: onRetake,
                    child: const Text(
                      'Retake Photo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Submit Photo Button
                Container(

                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      backgroundColor: const Color(0xFF024206),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page7()),
                        );
                      // Implement submission logic here
                    },
                  
                    child: const Text(
                      'Submit Photo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
