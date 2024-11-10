import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("w4_s3_Ex1_pt2")),
        body: Center(
          child: SelectableButton(),
        ),
      ),
    );

  }

}

class SelectableButton extends StatefulWidget {

  @override
  _SelectableButtonState createState() => _SelectableButtonState(); //NOTE: to store the button's selection status when pressed

}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;  // NOTE: variable = bool to check wether it's no/selected

  // Getter meth for button pro_based on selection status
  //Difficulty: Medium

  String get buttonText => isSelected ? "Selected" : "Not Selected";   //NOTE: Returns "Selected" if isSelected is T, otherwise "Not Selected"
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggleSelection() {

    setState(() { // to update isSelected for T/F
      isSelected = !isSelected;
    });

  }


  //NOTE: sample code

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 100,
        child: ElevatedButton(
          onPressed: toggleSelection,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, // Updated to backgroundColor
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor), // Text color
            ),
          ),
        ),
      ),
    );
  }
}
