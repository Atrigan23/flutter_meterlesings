import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ImagePage());
  
}


class ImagePage extends StatefulWidget{
  Widget build(BuildContext context)=> Scaffold(
  appBar: AppBar(title: Text('Image'),),
);

  @override
  _ImageStatepage createState() => _ImageStatepage();

}

class _ImageStatepage extends State<ImagePage>{

  Future pickImage() async{

    await ImagePicker().pickImage(source: ImageSource.gallery);

  }


  @override 

  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.amber.shade300,
    body: Container(
      padding: EdgeInsets.all(32),
      child:Column ( children: [
        Spacer(),
        FlutterLogo(size: 160),
        const SizedBox(height:24),
        Text('Image Picker')
       ],
     ),));

 Widget buildbutton({

  required String title,
  required IconData icon,
  required VoidCallback onClicked,



 }) => ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(56),
 primary: Colors.white,
 onPrimary: Colors.black,
 textStyle: TextStyle(fontSize :20),

 ),
 child: Row(children: [
  Icon(icon, size: 28), const SizedBox(width: 16),
  Text(title),
  const SizedBox(height: 48),
  buildbutton(title: 'Pick Gallery',
   icon: Icons.camera_alt_outlined,
    onClicked:() => pickImage(),)
 ],
 ),
 
 
 onPressed: onClicked,);




}











































// class DecodeParam {
//   final File file;
//   final SendPort sendPort;
//   DecodeParam(this.file, this.sendPort);
// }

// void decodeIsolate(DecodeParam param) {
//   // Read an image from file (webp in this case).
//   // decodeImage will identify the format of the image and use the appropriate
//   // decoder.
//   var image = decodeImage(param.file.readAsBytesSync())!;
//   // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
//   var thumbnail = copyResize(image, width: 120);
//   param.sendPort.send(thumbnail);
// }

// // Decode and process an image file in a separate thread (isolate) to avoid
// // stalling the main UI thread.
// void main() async {
//   var receivePort = ReceivePort();

//   await Isolate.spawn(
//       decodeIsolate, DecodeParam(File('test.webp'), receivePort.sendPort));

//   // Get the processed image from the isolate.
//   var image = await receivePort.first as Image;

//   await File('thumbnail.png').writeAsBytes(encodePng(image));
// }