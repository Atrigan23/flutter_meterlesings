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

	final  m_Id=new TextEditingController();
	final  takkode=new TextEditingController();
	final  straat_adres=new TextEditingController();
  final  maand=new TextEditingController();
  final  datum_ingelees=new TextEditingController();
  final  personeel_nom=new TextEditingController();
  final  aktief=new TextEditingController();
  final  Image=new TextEditingController();
  
  
   
     
  
 Future<List<Users>> postData() async {
   
  final response = await http
      .post(Uri.parse('https://online.nwk.co.za/Systems/Meterlesings/API.php?function=Addmeterlesings'),

      body:{ "m_Id": m_Id.toString(),
	    "takkode": takkode.toString(),
	    "straat_adres":straat_adres.toString(),
      "maand":maand.toString(),
      "datum_ingelees":datum_ingelees.toString(),
      "personeel_nom":personeel_nom.toString(),
      "aktief":aktief.toString(),
	  
}

	   
      
      
      );
      //  final data = {'m_Id': m_Id,
      //   'takkode': takkode,
      //    'straat_adres' : straat_adres,
      //    'maand' : maand,
      //    'datum_ingelees' : datum_ingelees,
      //    'personeel_nom' : personeel_nom,
      //    'aktief' : aktief,};

        final data = json.decode(response.body);
    return data.map<Users>(Users.fromJson).toList();


  
}





  DateTime  date = DateTime(2022,12,24);


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
Widget _buildAktief(){

return TextFormField(
  controller:aktief,
  decoration: InputDecoration(labelText: 'Aktief/Onaktief'),
  validator: (  aktief){
    if(aktief == null || aktief.isEmpty){
      return 'State is required';
    }
  },
   onSaved: ( aktief){
  
  aktief == aktief;

   }
);
}
Widget _buildMonth(){

  String dropdownValue = 'January';
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
        });
      },
      items: <String>['January', 'Febuary', 'March', 'April','May','June','July','August','September','October','November','December']
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

  ]),         _buildTakkode(),
             _buildstraatAdres(),
             _buildMonth(),
             _buildpersoneelNom(),
             _buildAktief(),
            SizedBox(height: 100,),

             RaisedButton(child: Text('Submit'),color:Colors.blue, onPressed: ()=>{
              postData(),


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

