// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'Meterlesings.dart';

// void main(List<String> arguments) async {
// }

// // final allUsers = <Meterlesings>[
// // // Meterlesings( takkode: 'straat' , straat_adres: 'Straat' ,maand: 'Maand', datum_ingelees: "32323" , personeel_nom: "09322", aktief: "01", m_Id: 'Id',),

// // ];

// class UsersHtml {

//   Future<String> fetchUser2() async {
//   final response = await http
//       .get(Uri.parse('https://online.nwk.co.za/Systems/Meterlesings/API.php'));
//     String RealResult;
//       List<dynamic> returnRes = [];
//      Map<String , dynamic> Userdata ={};

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     final data = json.decode(response.body);
//      data.forEach((dataLine){
//     print('hohoho $dataLine');
     
//      Userdata ={
//     'm_Id': "${dataLine['m_Id']}" ,
//     'takkode': "${dataLine['takkode']}" ,
//     'straat_adres': "${dataLine['straat_adres']}" ,
//     'maand': "${dataLine['maand']}" ,
//     'datum_ingelees' : "${dataLine['datum_ingelees']}" ,
//     'personeel_nom': "${dataLine['personeel_nom']}"  ,
//     'aktief': "${dataLine['aktief']}" ,
//     'image': "${dataLine['image']}" 
//      };
//     });
    
//     Meterlesings(
//      m_Id: Userdata['m_Id'] ,
//       takkode: Userdata['takkode'] ,
//       straat_adres: Userdata['straat_adres'] ,
//       maand: Userdata['maand'] ,
//       datum_ingelees: Userdata['datum_ingelees'],
//       personeel_nom: Userdata['personeel_nom']  ,
//       aktief: Userdata['aktief'],
//       image: Userdata['image'], Image: null,
//     );
//     returnRes = [Userdata['m_Id'], "/", Userdata['takkode'],"/", Userdata['straat_adres'],"/", Userdata['maand'],"/", Userdata['datum_ingelees'],"/", Userdata['personeel_nom'],"/", Userdata['aktief']] ;
//     RealResult = returnRes.join();
//     return RealResult ;
//   // return Users.fromJson(Userdata);
//   }
//   else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
// }
//  Future<Users> fetchUser() async {
//   final response = await http
//       .get(Uri.parse('https://online.nwk.co.za/Systems/Meterlesings/API.php'));
     
//      Map<String , dynamic> Userdata ={};

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     final data = json.decode(response.body);
//      data.forEach((dataLine){

//     print(dataLine);
     
//      Userdata ={
//     'm_Id': "${dataLine['m_Id']}" ,
//     'takkode': "${dataLine['takkode']}" ,
//     'straat_adres': "${dataLine['straat_adres']}" ,
//     'maand': "${dataLine['maand']}" ,
//     'datum_ingelees' : "${dataLine['datum_ingelees']}" ,
//     'personeel_nom': "${dataLine['personeel_nom']}"  ,
//     'aktief': "${dataLine['aktief']}" , 
//     'Image':"${dataLine['Image']}" };
//     });
//     Meterlesings(
//       m_Id: Userdata['m_Id'] ,
//       takkode: Userdata['takkode'] ,
//       straat_adres: Userdata['straat_adres'] ,
//       maand: Userdata['maand'] ,
//       datum_ingelees: Userdata['datum_ingelees'],
//       personeel_nom: Userdata['personeel_nom']  ,
//       aktief: Userdata['aktief'],
//       Image: Userdata['Image'], image: '',
//     );
    

//   return Users.fromJson(Userdata);
//   }
//   else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }



//   class Users {
//   final String m_Id;
//   final String takkode;
//   final String straat_adres;
//   final String maand;
//   final String datum_ingelees ;
//   final String personeel_nom ;
//   final String aktief ;
//   final String Image;

//   const Users({
//     required this.m_Id,
//     required this.takkode,
//     required this.straat_adres,
//     required this.maand,
//     required this.datum_ingelees,
//     required this.personeel_nom,
//     required this.aktief,
//     required this.Image,
//   });

//   factory Users.fromJson(Map<String, dynamic> json) {
//     String Id = json['m_Id'].toString();
//     String Tak = json['takkode'].toString();
//     String Straat = json['straat_adres'].toString();
//     String Maand = json['maand'].toString();
//     String Datum = json['datum_ingelees'].toString();
//     String Persoon = json['personeel_nom'].toString();
//     String Aktief = json['aktief'].toString();
//      String Image = json['Image'].toString();
    

//     return Users(
       
   
//         m_Id: Id,
//         takkode: Tak,
//         straat_adres: Straat,
//         maand: Maand,
//         datum_ingelees: Datum,
//         personeel_nom: Persoon,
//         aktief: Aktief, 
//         Image:Image, 
        
       
//     );
//   }

  
// }
// void ShowUsers() => runApp(const GetUsers());

// class GetUsers extends StatefulWidget {
//   const GetUsers({super.key});

//   @override
//   State<GetUsers> createState() => _MyAppState();
// }

// class _MyAppState extends State<GetUsers> {
//   late Future<Users> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//      futureAlbum = fetchUser();
//   });
   
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Users>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {

//                 return Text(snapshot.data!.takkode  );
                
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


// http://172.16.3.97/OnlineDev/Systems/Meterlesings%20D/API.php