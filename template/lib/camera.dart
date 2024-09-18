import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:template/screens/result.dart';
import 'package:template/screens/upload_photo.dart';
import 'package:template/screens/error.dart';


class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<Page7> {
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
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreviewScreen(imagePath: image.path, onRetake: _retakePhoto),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void _retakePhoto() {
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller!); // Display camera preview
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera),
      ),
    );
  }
}

// Image Preview Screen
class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRetake;

  const ImagePreviewScreen({super.key, required this.imagePath, required this.onRetake});

  // Function to upload the image
  Future<void> _uploadImage(BuildContext context) async {
    try {
      final uri = Uri.parse('http://10.0.2.2:5000/predict');
      final request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', imagePath));

      final response = await request.send();
      print(response);
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const Page8()),//Result
        // );
      } else {
        print('Failed to upload image');
        //  Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const Page8()),//Goes to error page
        // );
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        backgroundColor: const Color(0xFF024206),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: onRetake,
                      child: const Text(
                        'Retake Photo',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // Submit Photo Button
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        backgroundColor: const Color(0xFF024206),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Call the _uploadImage function to upload the image
                        //_uploadImage(context);
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Page11()), //Error
                                );
                      },
                      child: const Text(
                        'Submit Photo',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
