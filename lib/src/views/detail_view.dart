import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final pair;

  DetailView(this.pair);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: GestureDetector(
            child: Icon(Icons.chevron_left,),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Text(
          pair.toString(),
          style: TextStyle(
            fontSize: 18
          ),),
        ),
      )
    );
  }
}
