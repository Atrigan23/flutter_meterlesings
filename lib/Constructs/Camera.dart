import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatelessWidget{

File? image;
    Future pickImage() async{
        try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if( image == null ) return;

      final ImageTemporary = File(image.path);
      this.image = ImageTemporary;
      
  } on PlatformException catch (e){
    print('Failed to pick Image $e');
  }
        }

    
   Future pickGallery() async{

    try{
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if( image == null ) return;

    final ImageTemporary = File(image.path);
    this.image = ImageTemporary;
    }on
     PlatformException catch (e){
    print('Failed to pick Image $e');
  }

  

  }
  


@override 
Widget build(BuildContext context)=> Scaffold(
  appBar: AppBar(title: Text('Image'),),
  body: Container(
  child: Column(children: [
    Spacer(),
    const SizedBox(height: 24),
    FlatButton(  
                        child: Text('Image Picker'),  
                        color: Colors.purple,
                         
                        onPressed: () => pickImage(),  ),
                        const SizedBox(height: 24),
    FlatButton(  
                        child: Text('Gallery Picker'),  
                        color: Colors.purple,  
                        onPressed: () => pickGallery(),  )

  ]),




  ),
);

}