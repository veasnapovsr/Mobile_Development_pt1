import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

/// the Main screen to display expense lists
class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  
  /// List to store all registered expenses
  
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  /// to remove expense_an_undo_operation
  
  void _undoExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  /// to remove expense from the list
  
  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
    
///NOTE: New code line
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => _undoExpense(expense),
        ),
      ),
    );
  }

  /// adding new expense to List
  
  void _addExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  /// to create a new expense
  
  void _showAddExpenseForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ExpenseForm(onCreated: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Expenses App'), 
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.add), 
            onPressed: _showAddExpenseForm,
          ),
        ],
      ),
      
      body: ExpensesList(
        expenses: _registeredExpenses, //to pass List Expense
        onExpenseRemoved: _removeExpense, // to Callback 
      ),
    );
  }
}
