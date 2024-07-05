import 'package:expense_app/Widgets/Expenses/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/Models/expense_model.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.removeExpense});

  final List<ExpenseModel> expenses;
  final void Function({required ExpenseModel item}) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]), 
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              transform: const GradientRotation(1),
              colors: [
                Colors.blue.shade200,
                Colors.white,
              ],
            ),
          ),
          padding: const EdgeInsets.only(right: 20.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
              )
            ],
          ),
        ),
        onDismissed:(direction) {
          removeExpense(item: expenses[index]);
        },
        child: ExpensesItem(expense: expenses[index])
      )
    );
  }
}