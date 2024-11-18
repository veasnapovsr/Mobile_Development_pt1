import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  const Temperature({super.key});

  //override part is added
  @override
  Widget build(BuildContext context) {
    final textDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );

//Sample given code
    final inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Enter a temperature',
      hintStyle: const TextStyle(color: Colors.white),
    );

    //New decoration
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Converter"),
        backgroundColor: const Color(0xff16C062),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff16C062),
              Color(0xff00BCDC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        //Given sample code with fixing coda at line 42&43
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.thermostat_outlined,
                  size: 120,
                  color: Colors.white,
                ),
                const Center(
                  child: Text(
                    "Converter",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Temperature in Degrees:",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: inputDecoration,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                const Text("Temperature in Fahrenheit:",
                  style: TextStyle(color: Colors.white), //style is added
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: textDecoration,
                  child: const Text('Test',
                    style: TextStyle(color: Colors.black), //Style is added
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
