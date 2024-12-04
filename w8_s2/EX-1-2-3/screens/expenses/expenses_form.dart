import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

///using state class
///to add new expense

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({Key? key, required this.onCreated}) : super(key: key);

  /// Callback
  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  String? _selectedCategory; /// dropdown value
  DateTime? _selectedDate = DateTime.now(); ///date

  /// List of category names
  final List<String> _categories = [
    'LEISURE',
    'FOOD',
    'TRAVEL',
    'WORK',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  /// to open date_picker to select a date

  void _selectDate() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1), ///to select minimum_date
      maxTime: DateTime.now(), /// to select maximum-date
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
    );
  }

  ///form submission

  void _submitForm() {
    if (_titleController.text.isEmpty || _amountController.text.isEmpty || _selectedCategory == null) {
      return;
    }

    final amount = double.tryParse(_amountController.text);
    if (amount == null) return;
///// Validation:to make sure thath reaquired of(title, amount, category) are add

    //  category name CONVERTER to enum value
    final category = Category.values.firstWhere(
          (cat) => cat.name.toUpperCase() == _selectedCategory,
    );

    // Create a new expense instance
    final expense = Expense(
      title: _titleController.text,
      amount: amount,
      date: _selectedDate!,
      category: category,
    );

    widget.onCreated(expense);
    Navigator.pop(context);  ///To close the Form
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
          ),


          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixText: '\$ ',
            ),
          ),

          // to drop_down category selected
          DropdownButton<String>(
            value: _selectedCategory,
            hint: const Text('Select Category'),
            items: _categories.map((category) {
              return DropdownMenuItem(value: category, child: Text(category));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
          ),

          // Button to open date_picker
          TextButton(
            onPressed: _selectDate,
            child: Text(
              _selectedDate != null ? _selectedDate.toString() : 'Select Date',
            ),
          ),

          // Action buttons: Cancel & Add
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
