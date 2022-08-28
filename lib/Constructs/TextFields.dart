import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_meterlesings/main.dart';
import 'Camera.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'DatagridMeterlesing.dart';

class TextForm extends StatefulWidget{ 

  @override 
  State<StatefulWidget> createState(){
    return FormScreen();
  }
  


}





class FormScreen extends State<TextForm>{
  String? locateionImg;
	TextEditingController  takkode=new TextEditingController();
	TextEditingController  straat_adres=new TextEditingController();
  TextEditingController  maand=new TextEditingController();
  
  TextEditingController  personeel_nom=new TextEditingController();
  String dropdownValue = 'Jan';
 
  TextEditingController  Image=new TextEditingController();
  
  
   
     
  
 Future postData() async {
  
   print("takkode ${takkode.text}");	  
   print("straat_adres ${straat_adres.text}");	  
   print("maand $dropdownValue");	  
   print("personeel_nom ${personeel_nom.text}");	  
  var postUri = Uri.parse("https://online.nwk.co.za/Systems/Meterlesings/API.php");
  http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
  request.fields['function'] = 'Addmeterlesings';
  request.fields['takkode'] =  takkode.text;
  request.fields['straat_adres'] =  straat_adres.text;
  request.fields['maand'] =  maand.text;
  request.fields['personeel_nom'] =  personeel_nom.text;
  String  filePath =locateionImg! ;
  http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    'package',
    filePath,
    // filename: 'test.jpg',
    // contentType: MediaType('image', 'jpeg'),  
  );
//   final response = await http
//       .post(Uri.parse('https://online.nwk.co.za/Systems/Meterlesings/API.php?function=Addmeterlesings'),
//       body:{
// 	    "takkode": takkode.text,
// 	    "straat_adres":straat_adres.text,
//       "maand":maand.text,
//       "personeel_nom":personeel_nom.text,
// }
 request.files.add(multipartFile);
    request.send().then((response) async {
    var responseString = await response.stream.bytesToString();
print("HTML_RESULT $responseString");
      // print('Test ${response.stream.bytesToString()}');
      if (response.statusCode == 200) 
      {print("Uploaded!");
      
      return true ;
      }
    });
      
//       );
      //  final data = {'m_Id': m_Id,
      //   'takkode': takkode,
      //    'straat_adres' : straat_adres,
      //    'maand' : maand,
      //    'datum_ingelees' : datum_ingelees,
      //    'personeel_nom' : personeel_nom,
      //    'aktief' : aktief,};

    //     final data = json.decode(response.body);
    // return data.map<Users>(Users.fromJson).toList();

}





  DateTime  date = DateTime(2022,12,24);


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

File? image;
    Future pickImage() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);
      locateionImg = image.path.toString();

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
        }

    
   Future pickGallery() async{

   try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;
      locateionImg = image.path.toString();
      final imageTemp = File('$locateionImg');
      // locateionImg = imageTemp.toString();

      print('perm $locateionImg');
      
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


  

Widget _buildTakkode(){

return TextFormField(
  controller:takkode,
  decoration: InputDecoration(labelText: 'takkode'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'takkode is required';
    }
  },
   onSaved: ( value){
  
  takkode == value;

   }
);

}
Widget _buildstraatAdres(){

return TextFormField(
  controller:straat_adres,
  decoration: InputDecoration(labelText: 'Straat Adres'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'straat adres is required';
    }
  },
   onSaved: ( value){
  
  straat_adres == value;

   }
);
}
Widget _buildmaand(){

return TextFormField(
  controller:maand,
  decoration: InputDecoration(labelText: 'Maand'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'Maand is required';
    }
  },
   onSaved: ( value){
  
  maand == value;

   }
);
}

Widget _buildpersoneelNom(){

return TextFormField(
  controller:personeel_nom,
  decoration: InputDecoration(labelText: 'Personeel Nommer'),
  validator: (  value){
    if(value == null || value.isEmpty){
      return 'Personeel Nommer is required';
    }
  },
   onSaved: ( value){
  
  personeel_nom == value;

   }
);
}

Widget _buildMonth(){

  // String dropdownValue = 'January';
return DropdownButton<String>(
  
  
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          print('yo $dropdownValue');
        });
      },
      items: <String>['Jan', 'Feb', 'Mar', 'April','May','June','July','August','September','October','November','December']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

}




 @override

  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView( child: Container(
          child: Form(
            key: _formKey,
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
            Text(
              '',
                style: TextStyle(fontSize: 32)),
                const SizedBox(height: 16),
           
  Row(children: [
    Spacer(),
    const SizedBox(height: 24),
    FlatButton(  
                        child: Text('Image Picker'),  
                        color: Colors.green,
                         
                        onPressed: () => pickImage(),  ),
                        const SizedBox(height: 24),
    FlatButton(  
                        child: Text('Gallery Picker'),  
                        color: Colors.green,  
                        onPressed: () => pickGallery(),  )

  ]),         _buildTakkode(),
             _buildstraatAdres(),
             _buildMonth(),
             _buildpersoneelNom(),
             
            SizedBox(height: 100,),

             RaisedButton(child: Text('Submit'),color:Colors.blue, onPressed: ()=>{
              


                if(_formKey.currentState!.validate()){

                  postData(),
                },

                
              _formKey.currentState!.save(),



             },)
           ,
            
          ] )),
        ),

    ));




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

