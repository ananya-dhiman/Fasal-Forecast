
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  File? image ;
  final _picker = ImagePicker();
  bool showSpinner = false ;

  Future getImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery , imageQuality: 80);

    if(pickedFile!= null ){
      image = File(pickedFile.path);
      setState(() {

      });
    }else {
      print('no image selected');
    }
  }

  Future<void> uploadImage ()async{

    setState(() {
      showSpinner = true ;
    });

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                child: image == null ? Center(child: Text('Pick Image'),)
              :
              Container(
                child: Center(
                  child: Image.file(
                    File(image!.path).absolute,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ),
            ),
            SizedBox(height: 150,),
            GestureDetector(
              onTap: (){
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
