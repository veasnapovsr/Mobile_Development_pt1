import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  String? dropDownValue;
  Category? allCategory = Category.travel;
  DateTime? datePick = DateTime.now();
  List<String> allCategoryList = [
    'LEISURE',
    'FOOD',
    'TRAVEL',
    'WORK',
  ];

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAddCategory(String? value){
    setState(() {
      dropDownValue = value;
    });
  }
  void showDate(){
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1890,12,30),
        maxTime: DateTime.now(),onConfirm: (date){
          setState(() {
            datePick = date;
          });

        }, currentTime: DateTime.now(),locale: LocaleType.en
    );
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);
    if(dropDownValue == 'LEISURE'){
      allCategory = Category.leisure;
    } else if(dropDownValue == 'FOOD'){
      allCategory = Category.food;
    } else if(dropDownValue == 'WORK'){
      allCategory = Category.work;
    } else {
      allCategory = Category.travel;
    }
    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: datePick!,
        category: allCategory!);

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text('Pick the Category',style: TextStyle(color: Colors.black,decoration: TextDecoration.none)),
                  DropdownButton(
                      value: dropDownValue,
                      items: allCategoryList.map((value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()
                      , onChanged: onAddCategory),
                ],
              ),

              TextButton(onPressed: showDate,
                  child: Text('$datePick',style: const TextStyle(color: Colors.blue,decoration: TextDecoration.none),))

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          )
        ],
      ),
    );
  }
}
