import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;   
import 'package:palette_generator/palette_generator.dart';
List<CameraDescription> cameras;

class CameraDupe extends StatefulWidget {
  final Function onSelectImage; 
  ImageProvider im; 

  CameraDupe(this.onSelectImage); 
  
  @override
  _CameraDupeState createState() => new _CameraDupeState();
}

class _CameraDupeState extends State<CameraDupe> {

  File _storedImage;
  PaletteGenerator generator; 
    void initState() {
      super.initState(); 
    _updatePaletteGenerator(); 
  }
  
  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
    setState(() {
      _storedImage = imageFile;
    });
    final appDirectory = await sysPath.getApplicationDocumentsDirectory(); 
    final fileName = path.basename(imageFile.path); //where our image is currently stored 
    final savedImage = await imageFile.copy('${appDirectory.path}/$fileName'); //will take a bit of time 
    widget.onSelectImage(savedImage); 
    //^Will worked with this savedImage in other parts of our code  
  }

  Future<void> _selectPicture() async {
    final imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 600, maxWidth: 600);
    setState(() {
      _storedImage = imageFile;
    });
  }
  
  Future<void> _updatePaletteGenerator() async {
    // var paletteGenerator = await PaletteGenerator.fromImageProvider(
    //   widget.im, maximumColorCount: 3 
    // );
    
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> swatches = <Color>[]; 

    // if (generator.colors.isNotEmpty) {
    //   for (Color color in generator.colors) {
    //     swatches.add(color); 
    //   }
    // }
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: _storedImage != null
                  ? Image.file(
                      _storedImage,
                      fit: BoxFit.fill,
                    )
                  : Text('No Image Picked')),
          FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicture,
          ),
          FlatButton.icon(
            icon: Icon(Icons.picture_in_picture),
            label: Text('Select Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _selectPicture,
          )
        ],
      ),
    )
    );
  }
}
