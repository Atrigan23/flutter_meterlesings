import 'dart:io';
import 'dart:convert';
import 'package:flutter_meterlesings/Demos/Meterlesing.dart';
import 'package:flutter_meterlesings/Meterlesings/Meterlesings.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';



void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(Datasource());
}

/// The application that contains datagrid on it.
class Datasource extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
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
     late  MeterlesingDataSource meterlesingDataSource;
      late List<GridColumn> _columns;

  Future<dynamic> generateMeterList() async {
 
  // Give your sever URL of get_employees_details.php file
    const String Endpoint = 'https://online.nwk.co.za/Systems/Meterlesings/API.php' ;
    final Uri url = Uri.parse(Endpoint);


    final response = await http.get(url);
    var list = json.decode(response.body);
    List<Meterlesing> meterlesings =
        await list.map<Meterlesing>((json) => Meterlesing.fromJson(json)).toList();
    final meterlesingDataSource = MeterlesingDataSource(meterlesings);
    return meterlesings;

    
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'm_Id',
          width: 70,
          label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'm_Id',
              ))),
      GridColumn(
          columnName: 'takkode',
          width: 80,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('takkode'))),
      GridColumn(
          columnName: 'straat_adres',
          width: 120,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text(
                'straat_adres',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'maand',
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('maand'))),
              GridColumn(
          columnName: 'datum_ingelees',
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('datum_ingelees'))),
              GridColumn(
          columnName: 'personeel_nom',
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('personeel_nom'))),
              GridColumn(
          columnName: 'aktief',
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('aktief'))),
    ];

   

  }

  

  @override
   Widget  build(BuildContext context) {

     @override
  void initState() {
    late  MeterlesingDataSource meterlesingDataSource;
    super.initState();
    _columns = getColumns();
  }
    return Scaffold(
        appBar: AppBar(
          title: Text('Syncfusion flutter datagrid'),
        ),
        body: FutureBuilder<dynamic>(
            future: generateMeterList(),
            builder: (context, data) {
              return data.hasData
                  ? SfDataGrid(
                      source: meterlesingDataSource,
                      columnWidthMode: ColumnWidthMode.fill,
                      columns: _columns)
                  : Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: 0.8,
                    ));
            }));
  }


}
  




class MeterlesingDataSource extends DataGridSource {
   
 
  MeterlesingDataSource(this.meterlesings) {
    buildDataGridRow();
  }

    

  void buildDataGridRow() {
    MeterlesingDataGridRows = meterlesings
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: e.m_Id),
              DataGridCell<String>(columnName: 'name', value: e.takkode),
              DataGridCell<String>(
                  columnName: 'designation', value: e.maand),
                  DataGridCell<String>(
                  columnName: 'designation', value: e.datum_ingelees),
                  DataGridCell<String>(
                  columnName: 'designation', value: e.personeel_nom),
                  DataGridCell<String>(
                  columnName: 'designation', value: e.aktief),
                  
            ]))
        .toList();
  }
 
  List<Meterlesing> meterlesings = [];
 
  List<DataGridRow> MeterlesingDataGridRows = [];
 
  @override
  List<DataGridRow> get rows => MeterlesingDataGridRows;
 
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
 
  void updateDataGrid() {
    notifyListeners();
  }

  


  
}

  class Meter{


final String m_Id;
final String takkode;
final String straat_adres;
final String maand;
final String datum_ingelees ;
final String personeel_nom ;
final String aktief ;


const Meter({

required this.m_Id,
required this.takkode,
required this.straat_adres,
required this.maand,
required this.datum_ingelees,
required this.personeel_nom,
required this.aktief, 
});

Meter copy({

String? m_Id,
String? takkode,
String? straat_adres,
String? maand,
String? datum_ingelees,
String? personeel_nom,
String? aktief,

}) => 

Meter(m_Id: m_Id ?? this.m_Id,
  takkode: takkode ?? this.takkode,
 straat_adres: straat_adres ?? this.straat_adres,
  maand: maand ?? this.maand,
   datum_ingelees: datum_ingelees ?? this.datum_ingelees,
    personeel_nom: personeel_nom ?? this.personeel_nom,
     aktief: aktief ?? this.aktief);



     factory Meter.fromJson(Map<String, dynamic> json) {
      String Id = json['m_Id'].toString();
    return Meter(
        m_Id: Id,
        takkode: json['takkode'] as String,
        straat_adres: json['straat_adres'] as String,
        maand: json['maand'] as String,
        datum_ingelees: json['datum_ingelees'] as String,
        personeel_nom: json['personeel_nom'] as String,
        aktief: json['aktief'] as String,  
        
        );
  }

 Map<String, dynamic> toJson() => {
        'm_Id': m_Id,
        'takkode': takkode,
        'straat_adres': straat_adres,
        'maand': maand,
        'datum_ingelees': datum_ingelees,
        'personeel_nom': personeel_nom,
        'aktief': aktief,
      };


}



  class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

  


 








