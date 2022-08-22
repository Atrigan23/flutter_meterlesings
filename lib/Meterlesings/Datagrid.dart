import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart'; 
import 'M_users.dart';
import 'Meterlesings.dart';
import 'html.dart';
  
void main() {runApp(DataGrid());}  


  
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
    final columns =['ID','Takkode','Straat Adres','Maand','Datum ingelees','Personeel Nommer ', 'Aktief'];
    
    
    List<DataColumn>getColumns(List<String> columns ) =>
    columns.map((String column) => DataColumn(
    label: Text(column)

   )).toList();

   List<DataCell> getCells(List<dynamic> cells )=> 
    cells.map((data)=> DataCell(Text('$data'))).toList();

    List<DataRow> getRows(List<Meterlesings> meterlesings) =>  meterlesings.map((Meterlesings UserMeterlesing){

    final cells =[
    UserMeterlesing.m_Id,  
    UserMeterlesing.takkode,
    UserMeterlesing.straat_adres,
    UserMeterlesing.maand,
    UserMeterlesing.datum_ingelees,
    UserMeterlesing.personeel_nom,
    UserMeterlesing.aktief];


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

