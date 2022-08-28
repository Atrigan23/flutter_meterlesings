import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'Meterlesings.dart';
import 'html.dart';




// final allUsers = <Meterlesings>[
// Meterlesings( takkode: 'takkode' , straat_adres: "1234123" ,maand: "09", datum_ingelees: "32323" , personeel_nom: "09322", aktief: "01", m_Id: '2',),

// ];

// class Meter{


// final int m_Id;

// final String takkode;
// final String straat_adres;
// final String maand;
// final String datum_ingelees ;
// final String personeel_nom ;
// final String aktief ;


// const Meter({

// required this.m_Id,
// required this.takkode,
// required this.straat_adres,
// required this.maand,
// required this.datum_ingelees,
// required this.personeel_nom,
// required this.aktief, 
// });

// Meter copy({

// int? m_Id,
// String? takkode,
// String? straat_adres,
// String? maand,
// String? datum_ingelees,
// String? personeel_nom,
// String? aktief,


  
// }) => 

// Meter(m_Id: m_Id ?? this.m_Id,
//   takkode: takkode ?? this.takkode,
//  straat_adres: straat_adres ?? this.straat_adres,
//   maand: maand ?? this.maand,
//    datum_ingelees: datum_ingelees ?? this.datum_ingelees,
//     personeel_nom: personeel_nom ?? this.personeel_nom,
//      aktief: aktief ?? this.aktief);



    //  factory Meter.fromJson(Map<String, dynamic> json) {
    // return Meter(
    //     m_Id: int.parse(json['m_Id']),
    //     takkode: json['takkode'] as String,
    //     straat_adres: json['straat_adres'] as String,
    //     maand: json['maand'] as String,
    //     datum_ingelees: json['datum_ingelees'] as String,
    //     personeel_nom: json['personeel_nom'] as String,
    //     aktief: json['aktief'] as String,
        
        
        
//         );
//   }

//  Map<String, dynamic> toJson() => {
//         'm_Id': m_Id,
//         'takkode': takkode,
//         'straat_adres': straat_adres,
//         'maand': maand,
//         'datum_ingelees': datum_ingelees,
//         'personeel_nom': personeel_nom,
//         'aktief': aktief,
//       };


// }


// Future<dynamic> generateMeterlesingList() async {
 
//  final response = await http
//       .get(Uri.parse('https://online.nwk.co.za/Systems/Meterlesings/API.php'));

//     var list = json.decode(response.body);
//     List<Meterlesings> _meterlesings =
//         await list.map<Meterlesings>((json) => Meterlesings.fromJson(json)).toList();
//       meterlesingdata = Meterlesingdata(_meterlesings);
//     return _meterlesings;
//   }

//  class Meterlesingdata extends DataGridSource {
 
//   Meterlesingdata(this.meterlesings) {
//     buildDataGridRow();
//   }
 
//   void buildDataGridRow() {
//     _MeterlesingDataGridRows = meterlesings
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'm_Id', value: e.m_Id),
//               DataGridCell<String>(columnName: 'takkode', value: e.takkode),
//               DataGridCell<String>(columnName: 'straat_adres', value: e.straat_adres),
//               DataGridCell<String>(columnName: 'maand', value: e.maand),
//               DataGridCell<String>(columnName: 'datum_ingelees', value: e.datum_ingelees),
//               DataGridCell<String>(columnName: 'straat_adres', value: e.straat_adres),
//                 DataGridCell<String>(columnName: 'aktief', value: e.aktief),
              
//             ]))
//         .toList();
//   }

//   List<Meterlesings> meterlesings = [];
 
//   List<DataGridRow> _MeterlesingDataGridRows = [];
 
//   @override
//   List<DataGridRow> get rows => _MeterlesingDataGridRows;
 
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
 
//   void updateDataGrid() {
//     notifyListeners();
//   }

// @override
//   Widget build(BuildContext context) {

//  final columns =['Takkode','Straat Adres','Maand','Datum ingelees','Personeel Nommer ', 'Aktief'];

//    List<DataColumn>getColumns(List<String> columns ) =>
//     columns.map((String column) => DataColumn(
//     label: Text(column)

//    )).toList();



//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Syncfusion flutter datagrid'),
//         ),
//         body: FutureBuilder<Object>(
//             future: generateMeterlesingList(),
//             builder: (context, data) {
//               return data.hasData
//                   ? SfDataGrid(
//                       source: meterlesingdata,
//                       columnWidthMode: ColumnWidthMode.fill,
//                       columns: getColumns(columns))
//                   : Center(
//                       child: CircularProgressIndicator(
//                       strokeWidth: 2,
//                       value: 0.8,
//                     ));
//             }));
//   }

// }
 
// class Meterlesings {
//   final int m_Id;
//   final String takkode;
//   final String straat_adres;
//   final String maand;
//   final String datum_ingelees ;
//   final String personeel_nom ;
//   final String aktief ;
 
//   Meterlesings({ required this.m_Id,
//     required this.takkode,
//     required this.straat_adres,
//     required this.maand,
//     required this.datum_ingelees,
//     required this.personeel_nom,
//     required this.aktief,});
 
  // factory Meterlesings.fromJson(Map<String, dynamic> json) {
  //   return Meterlesings(
  //       m_Id: int.parse(json['m_Id']),
  //       takkode: json['takkode'] as String,
  //       straat_adres: json['straat_adres'] as String,
  //       maand: json['maand'] as String,
  //       datum_ingelees: json['datum_ingelees'] as String,
  //       personeel_nom: json['personeel_nom'] as String,
  //       aktief: json['aktief'] as String,
        
        
        
  //       );
  // }
  

  
// } 


