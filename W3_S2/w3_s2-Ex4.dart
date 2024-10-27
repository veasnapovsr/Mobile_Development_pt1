

//Hardly underdtand Ex4 Instructions

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//to create MyApp Class
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(

//had some difficulty in this part
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(text: 'OOP', color: Colors.blue[100]!),
              SizedBox(height: 20),
              CustomCard(text: 'DART', color: Colors.blue[300]!),
              SizedBox(height: 20),
              CustomCard(text: 'FLUTTER', color: Colors.blue[600]!),

            ],
          ),

        ),

      ),
    );

  }
}

class CustomCard extends StatelessWidget {

  final String text;
  final Color color;

  CustomCard({
    required this.text,
    this.color = Colors.blue,

  });

  @override

  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),

      ),

      child: Center(

        child: Padding(

          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),

          ),

        ),
      ),
    );
  }
}
