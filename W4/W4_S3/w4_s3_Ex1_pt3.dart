import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("w4_s3_Ex1_pt3")),
        body: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,  //NOTE:new

            children: [
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
              SizedBox(height: 10),
              SelectableButton(),
            ],

          ),
        ),
      ),
    );
  }
}

//w4_s3_Ex1_SAMPLE

class SelectableButton extends StatefulWidget {

  @override
  _SelectableButtonState createState() => _SelectableButtonState();

}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  // Getter methods for button prop_based on selection status
  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggleSelection() {

    setState(() {
      isSelected = !isSelected;

    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
