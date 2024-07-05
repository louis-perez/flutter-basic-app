import 'package:flutter/material.dart';
import 'package:expense_app/Widgets/expenses.dart';
import 'package:expense_app/Widgets/Expenses/expenses_create.dart';
import 'package:expense_app/Models/expense_model.dart';
import 'package:expense_app/Widgets/Chart/chart.dart';

var normColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue.shade500,
  primary: Colors.white,
  primaryContainer: Colors.blue.shade500,
  secondary: Colors.blueGrey.shade900,
  secondaryContainer: Colors.blue.shade200
);

var darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 10, 44, 71),
  primary: Colors.white,
  primaryContainer: const Color.fromARGB(255, 10, 44, 71),
  secondary: Colors.blueGrey.shade900,
  secondaryContainer: const Color.fromARGB(255, 51, 71, 87)
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker',
      theme: ThemeData(
        colorScheme: normColorScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final title = 'Expense List';
  final List<ExpenseModel> _registeredExpense = [
    ExpenseModel(title: 'Flutter Course 1', amount: 19.99, date: DateTime.now(), category: Category.food),
    ExpenseModel(title: 'Flutter Course 2', amount: 19.99, date: DateTime.now(), category: Category.leisure),
    ExpenseModel(title: 'Flutter Course 3', amount: 19.99, date: DateTime.now(), category: Category.travel),
  ];
  
  void addExpenseItem({required ExpenseModel item}) {
    setState(() {
      _registeredExpense.add(item);
    });
  }

  void removeExpenseItem({required ExpenseModel item}) {
    final expenseIndex = _registeredExpense.indexOf(item);
    setState(() {
      _registeredExpense.remove(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense has been deleted'),
        action: SnackBarAction(
          label: 'Undo Deletion', 
          onPressed: (){
            setState(() {
              _registeredExpense.insert(expenseIndex, item);
            });
          }
        )
      )
    );
  }

  void _openAddExpense() {
    setState(() {  
      showModalBottomSheet(
        enableDrag: true,
        showDragHandle: true,
        isScrollControlled: true,
        context: context, 
        builder: (ctx) {
          return SizedBox(
            height: MediaQuery.of(context).copyWith().size.height * 0.65,
            child: SingleChildScrollView(
              child: ExpensesCreate(addExpenseItem: addExpenseItem),
            )
          );
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!', 
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w200
      ))
    );

    if(_registeredExpense.isNotEmpty){
      mainContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10,),
          Chart(expenses: _registeredExpense),
          Expenses(registeredExpense: _registeredExpense, removeExpense: removeExpenseItem,),
          const SizedBox(height: 10),
        ],
      );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          )
        ),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: _openAddExpense, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Center(
        child: mainContent
      ),
    );
  }
}
