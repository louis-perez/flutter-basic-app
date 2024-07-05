import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatterDate = DateFormat.yMd();

enum Category {food, travel, leisure, work}

const categoryIcons = {
  Category.food: Icons.lunch_dining_rounded,
  Category.travel: Icons.two_wheeler_rounded,
  Category.leisure: Icons.movie_creation_outlined,
  Category.work: Icons.work_rounded
};

class ExpenseModel {
  ExpenseModel({required this.title, required this.amount, required this.date, required this.category}) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get getId => id;
  String get getTitle => title;
  double get getAmount => amount;
  String get getDate => formatterDate.format(date);
  Category get getCategory => category;
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(
    List<ExpenseModel> allExpenses, this.category
  ) : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<ExpenseModel> expenses;

  double get totalExpenses{
    double sum = 0;
    for (final expense in expenses){
      sum += expense.getAmount;
    }
    return sum;
  }
}