import 'package:e_commerc_mvvm_revirpoid/core/utils/assets.dart';
import 'package:e_commerc_mvvm_revirpoid/core/utils/const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';





class CameraScreen extends StatefulWidget {

  @override
  _CameraScreenState createState() => _CameraScreenState();


}

class _CameraScreenState extends State<CameraScreen> {
  String? fileName;
  File? imageFile;

  final picker = ImagePicker();
  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: const Text("Gallery"),
                      onTap: () {
                        _getFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: const Text("Camera"),
                      onTap: () {
                        _getFromCamera();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }


  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("imageFile----------------------------->${imageFile}");

        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print(imageBytes);
        // base64Image = base64UrlEncode(imageBytes);
        List<int> imageBytes = imageFile!.readAsBytesSync();

        final storage = FirebaseStorage.instance.ref().child('users/${Uri.file(imageFile!.path).pathSegments.last}').putFile(imageFile!).then((value){
          value.ref.getDownloadURL().then((value) {
            Strings.photo=value;
            print('photo${Strings.photo}');

          });
        });


        print(" code=>>${imageBytes}");
        // updatimge(base64Image, id);
      });
    }
  }
  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        // print("imageFile----------------------------->$imageFile");
        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print("dddd$imageBytes");
        // base64Image = base64UrlEncode(imageBytes);
        final storage = FirebaseStorage.instance.ref().child('users/${Uri.file(imageFile!.path).pathSegments.last}').putFile(imageFile!).then((value){
          value.ref.getDownloadURL().then((value) {
            Strings.photo=value;
            print('photo${Strings.photo}');


          });
        });

        List<int> imageBytes = imageFile!.readAsBytesSync();

      });
    }
  }
  @override
  Widget build(BuildContext context) {

// Create a reference to "mountains.jpg"

    print(Strings.photo);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [

        (imageFile==null)?Image.asset(Assetstring.profile,height: 100,):CircleAvatar(
          backgroundImage:FileImage(imageFile!,),

          radius: 65,

        ),
        Positioned(
          right: -20,
          top: -20,
          child: IconButton(onPressed: (){
            _showSelectionDialog(context);

          }, icon:const  Icon(Icons.camera_enhance,color: Colors.blue,),
          ),
        ),
      ],
    );
  }
}