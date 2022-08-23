import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart'; 
import 'M_users.dart';
import 'Meterlesings.dart';
import 'html.dart';
  final sl = GetIt.instance;
  
void main() {runApp(DataGrid());}  
void setup() {


// Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingleton<UsersHtml>(UsersHtml());
}

class DataGrid extends StatefulWidget {  
  @override  
  _DataTableExample createState() => _DataTableExample();  
}  
  
class _DataTableExample extends State<DataGrid> { 
  late List<Meterlesings> meterlesings; 
  @override  

  void initState(){
    super.initState();

    this.meterlesings = List.of(allUsers);
  }

  Widget buildDataTable()
  {
     var pels ;

    final columns =['ID','Takkode','Straat Adres','Maand','Datum ingelees','Personeel Nommer ', 'Aktief'];
    print('future');
    sl
    .get<UsersHtml>()
    .fetchUser2()
    .then((value)
    {
      pels =value.split('/');

      print('future2 ${pels[0]}');

    });
    print('future3 ${pels}');
    List<DataColumn>getColumns(List<String> columns ) =>
    columns.map((String column) => DataColumn(
    label: Text(column)

   )).toList();

   List<DataCell> getCells(List<dynamic> cells )=> 
    cells.map((data)=> DataCell(Text('$data'))).toList();
    List<DataRow> getRows(List<Meterlesings> meterlesings) =>  meterlesings.map((Meterlesings UserMeterlesing){
    print('bro ${UserMeterlesing.takkode}');
    print('bro  ${pels[0]}');


    final cells =[
    pels[0],  
    pels[1],
    pels[2],
    pels[3],
    pels[4],
    pels[5],
    pels[6],
    ];

 


    return DataRow(cells: getCells(cells) );
    }).toList();
    

    return DataTable(
    columns: getColumns(columns),
    rows: getRows(meterlesings),
    );
    
  }

   @override
  Widget build(BuildContext context) => Scaffold(  

    body: SingleChildScrollView( scrollDirection: Axis.horizontal, child: buildDataTable()),

    


  );  
}

