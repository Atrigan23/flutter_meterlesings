import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meterlesings/main.dart';
import 'Camera.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TextForm extends StatefulWidget{ 

  @override 
  State<StatefulWidget> createState(){
    return FormScreen();
  }
  

}



class FormScreen extends State<TextForm>{
  DateTime  date = DateTime(2022,12,24);

String _takkode = '';
String _straat_adres = '';
String _maand = '';
String _datum_ingelees = '';
String _personeel_nom = '';
String _aktief = '';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  

Widget _buildTakkode(){

return TextFormField(
  decoration: InputDecoration(labelText: 'takkode'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'takkode is required';
    }
  },
   onSaved: ( value){
  
  _takkode == value;

   }
);

}
Widget _buildstraatAdres(){

return TextFormField(
  decoration: InputDecoration(labelText: 'Straat Adres'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'straat adres is required';
    }
  },
   onSaved: ( value){
  
  _straat_adres == value;

   }
);
}
Widget _buildmaand(){

return TextFormField(
  decoration: InputDecoration(labelText: 'Maand'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'Maand is required';
    }
  },
   onSaved: ( value){
  
  _maand == value;

   }
);
}

Widget _buildpersoneelNom(){

return TextFormField(
  decoration: InputDecoration(labelText: 'Personeel Nommer'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'Personeel Nommer is required';
    }
  },
   onSaved: ( value){
  
  _personeel_nom == value;

   }
);
}
Widget _buildAktief(){

return TextFormField(
  decoration: InputDecoration(labelText: 'Aktief/Onaktief'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'State is required';
    }
  },
   onSaved: ( value){
  
  _aktief == value;

   }
);
}




 @override

  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          child: Form(
            key: _formKey,
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
            Text(
              '${date.year}/${date.month}/${date.day}',
                style: TextStyle(fontSize: 32)),
                const SizedBox(height: 16),ElevatedButton(child: Text('Select Date'),
                onPressed: () async {DateTime? newDate = await
              showDatePicker(context: context,
              initialDate: date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100)
              );

              if(newDate == null)
              return;

              setState(() => date = newDate);


  }
  ),
  Row(children: [
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
             _buildTakkode(),
             _buildstraatAdres(),
             _buildmaand(),
             _buildpersoneelNom(),
             _buildAktief(),
            SizedBox(height: 100,),

             RaisedButton(child: Text('Submit'),color:Colors.blue, onPressed: ()=>{


                if(_formKey.currentState!.validate()){

                  
                },

                
              _formKey.currentState!.save()



             },),

          ] )),
        ),

    );




}







//     Center:Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // The first text field is focused on as soon as the app starts.
//              TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Enter your takkode',
//             ),
//           ),
//             // The second text field is focused on when a user taps the
//             // FloatingActionButton.
//             TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Enter your _straat_adres',
//             ),
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Enter your _maand',
//             ),
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Enter your _datum_ingelees',
//             ),
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5),),
//               labelText: 'Enter your _personeel_nom',
//             ),
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Enter your _aktief',
//             ),
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Enter your _image',
//             ),
//           ),
//           ],
//         ),);
   }
  

  
 
   
  
  


   



// // class FormScreenState extends State<Formscreen>{

// // // String _takkode;
// // // String _straat_adres;
// // // String _gebou_adres;
// // // String _maand;
// // // String _datum_ingelees;
// // // String _personeel_nom;
// // // String _aktief;
// // // String _image;


// // Widget build(BuildContext context ){
// // return Scaffold(appBar: AppBar (title: Text('Form Upload'))
// // body: Container(margin: EdgeInsets.all(24)),);

// }




// }

