import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Meterlesings.dart';
import 'M_users.dart';


void main(List<String> arguments) async {
}

final allUsers = <Meterlesings>[
Meterlesings( takkode: 'straat' , straat_adres: 'Straat' ,maand: 'Maand', datum_ingelees: "32323" , personeel_nom: "09322", aktief: "01", m_Id: 'Id',),

];


 Future<Users> fetchUser() async {
  final response = await http
      .get(Uri.parse('https://online.nwk.co.za/Systems/Meterlesings/API.php'));
     
     Map<String , dynamic> Userdata ={};

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final data = json.decode(response.body);
     data.forEach((dataLine){

    print(dataLine);
     
     Userdata ={
    'm_Id': "${dataLine['m_Id']}" ,
    'takkode': "${dataLine['takkode']}" ,
    'straat_adres': "${dataLine['straat_adres']}" ,
    'maand': "${dataLine['maand']}" ,
    'datum_ingelees' : "${dataLine['datum_ingelees']}" ,
    'personeel_nom': "${dataLine['personeel_nom']}"  ,
    'aktief': "${dataLine['aktief']}" ,  };
    });

  return Users.fromJson(Userdata);
    
  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



  class Users {
  final String m_Id;
  final String takkode;
  final String straat_adres;
  final String maand;
  final String datum_ingelees ;
  final String personeel_nom ;
  final String aktief ;

  const Users({
    required this.m_Id,
    required this.takkode,
    required this.straat_adres,
    required this.maand,
    required this.datum_ingelees,
    required this.personeel_nom,
    required this.aktief,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    String Id = json['m_Id'].toString();
    String Tak = json['takkode'].toString();
    String Straat = json['straat_adres'].toString();
    String Maand = json['maand'].toString();
    String Datum = json['datum_ingelees'].toString();
    String Persoon = json['personeel_nom'].toString();
    String Aktief = json['aktief'].toString();

    return Users(
       
   
        m_Id: Id,
        takkode: Tak,
        straat_adres: Straat,
        maand: Maand,
        datum_ingelees: Datum,
        personeel_nom: Persoon,
        aktief: Aktief,  
        
       
    );
  }

  
}
void ShowUsers() => runApp(const GetUsers());

class GetUsers extends StatefulWidget {
  const GetUsers({super.key});

  @override
  State<GetUsers> createState() => _MyAppState();
}

class _MyAppState extends State<GetUsers> {
  late Future<Users> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Users>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return Text(snapshot.data!.takkode  );
                
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}


// http://172.16.3.97/OnlineDev/Systems/Meterlesings%20D/API.php