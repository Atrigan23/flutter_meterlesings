// import 'dart:developer';

// import 'package:get_it/get_it.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart'; 
// import 'M_users.dart';
// import 'Meterlesings.dart';
// import 'html.dart';
//   final sl = GetIt.instance;
  
// void main() {runApp(DataGrid());}  
// void setup() {


// // Alternatively you could write it if you don't like global variables
//   GetIt.I.registerSingleton<UsersHtml>(UsersHtml());
// }

// class DataGrid extends StatefulWidget {  
//   @override  
//   _DataTableExample createState() => _DataTableExample();  
// }  
  
// class _DataTableExample extends State<DataGrid> { 
//   late List<Meterlesings> meterlesings; 
//   @override  

//   void initState(){
//     super.initState();

//     this.meterlesings = List.of(allUsers);
//   }

//   Future<Object> buildDataTable() async
//   {
//      var meter ;

//     final columns =['ID','Takkode','Straat Adres','Maand','Datum ingelees','Personeel Nommer ', 'Aktief'];
    
//     sl
//     .get<UsersHtml>()
//     .fetchUser2()
//     .then((value)
//     {
//       meter =value.split('/');

//       print('future2 ${meter[2]}');
//       print('future3 ${meter[3]}');

   

//     });
    
//     List<DataColumn>getColumns(List<String> columns ) =>
//     columns.map((String column) => DataColumn(
//     label: Text(column)

//    )).toList();

//     List<DataCell> getCells(List<dynamic> cells )=> 
//     cells.map((data)=> DataCell(Text('$data'))).toList();
//     List<DataRow> getRows(List<Meterlesings> meterlesings) =>   meterlesings.map((Meterlesings UserMeterlesing){
   
//     print('bro ${UserMeterlesing.takkode}');
//     print('bro  ${meter[0]}');
    

//     final cells =[
//     meter[0],  
//     meter[1],
//     meter[2],
//     meter[3],
//     meter[4],
//     meter[5],
//     meter[6],
//     ];

 
//  print('bro ${UserMeterlesing.takkode}');
//     print('bro  ${meter[0]}');

//     return DataRow(cells: getCells(cells) );
//     }).toList();
    

//     return DataTable(
//     columns: getColumns(columns),
//     rows: getRows(meterlesings),
//     );
    
//   }

//    @override
//   Widget build(BuildContext context) => Scaffold(  

//       body: SingleChildScrollView( scrollDirection: Axis.horizontal),

//   );
       
//   }




