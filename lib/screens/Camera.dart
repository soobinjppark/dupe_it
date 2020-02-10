import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; 
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

List<CameraDescription> cameras; 

class Camera extends StatefulWidget {

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _storedImage; 

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 600, maxWidth: 600); 
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      FlatButton.icon(
        icon: Icon(Icons.camera),
        label: Text('Take Picture'), 
        textColor: Theme.of(context).primaryColor,
        onPressed: _takePicture,
      )
      
    );
  }
}

