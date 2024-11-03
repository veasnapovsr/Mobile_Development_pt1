import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//the stateless widget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      title: 'Hobby Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHobbiesPage(),
    );
  }
}

//hobby page class

class MyHobbiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Hobbies"),
      ),
      body: Column(

        children: [
          HobbyCard(

            title: 'Travelling',
            icon: Icons.flight,
            backgroundColor: Colors.green,

          ),

          HobbyCard(

            title: 'Skating',
            icon: Icons.skateboarding,
            backgroundColor: Colors.blueGrey,

          ),

        ],
      ),
    );
  }
}

//hobby card class

class HobbyCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color backgroundColor;

  const HobbyCard({

    Key? key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

//Some part of codes below are helped due to bug,issues,syntax etc

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
