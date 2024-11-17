import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [ //const is removed from Children, but replace to each label due to "list dynamic" each method is runtime
            //Fixed:
            const Label("Method 1: Loop in Array", bold: true),
            // TODO: Method 1: Loop in Array
            ..._buildColorsWithLoop(),                                 //the 3 colors are added to the ListView
             const Label("Method 2: Map", bold: true),
            // TODO: Method 2: Using map()
            ...colors.map((color) => Label(color)).toList(),          //map method apply function to color list
             const Label("Method 3: Dedicated Function", bold: true), //.toList() method converts the Iterable returned by map() into a List<Widget>.
            // TODO: Method 3: Dedicated function
            ..._buildColorsWithFunction(),
          ],
        ),
      ),
    ),
  ));
}

//Addable:

// Method 1: Using a direct loop
List<Widget> _buildColorsWithLoop() {
  List<Widget> widgets = [];
  for (var color in colors) { //for loop iterate the colors of list
    widgets.add(Label(color)); //each color inside list, a label widget si create to add to widgets lists
  }
  return widgets;
}

// Method 2: Using map()
//NOTE:map() method produces a List<Widget> (after converting to a list using .toList()),no requirement to encapsulate a separate function

// Method 3: Using a dedicated function
List<Widget> _buildColorsWithFunction() {    //Encapsolation for creating list of Label widgets
  return colors.map((color) => Label(color)).toList();
}

//Given code:

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
      TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
