import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_meterlesings/Demos/Meterlesing.dart';
import 'package:flutter_meterlesings/Meterlesings/Meterlesings.dart';
import 'package:flutter_meterlesings/Meterlesings/html.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';
import 'TextFields.dart';


var image= '';
class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  
  const SecondRoute({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
          flexibleSpace: Container(
      decoration: 
      BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://online.nwk.co.za/Systems/Meterlesings/photos/$image'),
          fit: BoxFit.cover,
        ),
      ),
  ),
      ),
      
      body: new Container(
        decoration: 
      BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://online.nwk.co.za/Systems/Meterlesings/photos/$image'),
          fit: BoxFit.cover,
        ),
      ),
      ),
    );
  }
}

/// The application that contains datagrid on it.
class MeterListLpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Datapage(),
    );
  }
}
class Datapage extends StatefulWidget {
  /// Creates the home page.
  Datapage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

  
}

class _MyHomePageState extends State<Datapage> {

Future<List<Users>> usersFuture = GetUsers();

static Future<List<Users>> GetUsers() async {
   
  final response = await http
      .get(Uri.parse('https://online.nwk.co.za/Systems/Meterlesings/API.php?function=Getmeterlesings'));
        
  final data = json.decode(response.body);
  print('datameer $data');
  return data.map<Users>(Users.fromJson).toList();


  
}


@override
Widget build(BuildContext context) =>Scaffold (
  appBar: AppBar(
   
    centerTitle: true,
  ),
  body: 
  Center(child:
   FutureBuilder<List<Users>>(
    future: usersFuture,
   builder:(context, snapshot){
     if(snapshot.hasData){
      final users = snapshot.data!;

      return buildUsers(users);
     }
     else{
      return const Text('no data');
     }
   },
   ),
   ),
   );


Widget buildUsers(List<Users> users) => ListView.builder(
  itemCount: users.length,
  
  itemBuilder: (context,index){
    final user= users[index];
    image =user.Image;
    return SingleChildScrollView(child: Card( 
      
      child:
       ListTile( 
        leading: CircleAvatar(
          backgroundImage:  NetworkImage('https://online.nwk.co.za/Systems/Meterlesings/photos/${user.Image}'), // no matter how big it is, it won't overflow
        ),
        onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
},

       title: Text(user.datum_ingelees),
      subtitle: Text(user.personeel_nom),
      ),
    ));
  },
);





}

class Users{

final int m_Id;
final String takkode;
final String straat_adres;
final String maand;
final String datum_ingelees ;
final String personeel_nom ;
final String aktief ;
final String Image;


const Users({

required this.m_Id,
required this.takkode,
required this.straat_adres,
required this.maand,
required this.datum_ingelees,
required this.personeel_nom,
required this.aktief,
required this.Image 
});


static Users fromJson(json)=> Users(

        m_Id:(json['m_Id']),
        takkode: json['takkode'] ,
        straat_adres: json['straat_adres'] ,
        maand: json['maand'] ,
        datum_ingelees: json['datum_ingelees'] ,
        personeel_nom: json['personeel_nom'],
        aktief: json['aktief'], 
        Image: json['Image'] , 
   


);


        




}