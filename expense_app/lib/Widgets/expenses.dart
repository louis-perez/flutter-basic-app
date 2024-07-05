import 'package:expense_app/Widgets/Expenses/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/Models/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.registeredExpense, required this.removeExpense});

  final List<ExpenseModel> registeredExpense;
  final void Function({required ExpenseModel item}) removeExpense;

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses>{

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ExpensesList(expenses: widget.registeredExpense, removeExpense: widget.removeExpense,),
    );
  }
}