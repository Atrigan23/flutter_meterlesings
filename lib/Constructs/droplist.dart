import 'package:flutter/material.dart';
class InfoPage extends StatelessWidget{

@override 
Widget build(BuildContext context)=> Scaffold(
  appBar: AppBar(title: Text('Info'),),
);

}
class Dropapp extends StatelessWidget {
  const Dropapp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: Scaffold(
        body: const Center(
          child: DROPLIST(),
        ),
      ),
    );
  }
}

class DROPLIST extends StatefulWidget {
  const DROPLIST({Key? key}) : super(key: key);

  @override
  State<DROPLIST> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<DROPLIST> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
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
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}