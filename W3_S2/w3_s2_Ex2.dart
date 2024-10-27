import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blue[300],
        margin: EdgeInsets.all(30.0),
        padding: EdgeInsets.all(40.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              "CADT STUDENTS",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                decoration: TextDecoration.none, 
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
