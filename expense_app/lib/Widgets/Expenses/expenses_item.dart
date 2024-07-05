import 'package:flutter/material.dart';
import 'package:expense_app/Models/expense_model.dart';

class ExpensesItem extends StatelessWidget{
  ExpensesItem({super.key, required this.expense});

  final ExpenseModel expense;
  final Color textColor = Colors.blueGrey.shade900;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade200,
      shadowColor: Colors.black,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
          children: [
            Text(expense.getTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 4
            ),
            Row(
              children: [
                Text('Expense Amount: \$${expense.getAmount.toStringAsFixed(2)}'),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(categoryIcons[expense.getCategory]),
                      ],
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        Text(expense.getDate)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }
}