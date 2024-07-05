import 'package:expense_app/Models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesCreate extends StatefulWidget{
  const ExpensesCreate({super.key, required this.addExpenseItem});

  final void Function({required ExpenseModel item}) addExpenseItem;

  @override
  State<ExpensesCreate> createState() {
    return _ExpensesCreate();
  }
}

class _ExpensesCreate extends State<ExpensesCreate>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  late Category selectedCategory;

  String _capitalize(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  Future<void> _selectDate() async{
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100), 
      lastDate: DateTime(DateTime.now().year + 100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(  // override MaterialApp ThemeData
            colorScheme: ColorScheme.light(
              primary: Colors.blue.shade500,  //header and selced day background color
              onSurface: Colors.black, // Month days , years 
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // ok , cancel    buttons
              ),
            ),
          ),
          child: child!
        );
      },
    );

    if(picked != null){
      setState(() {
      _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  void _submitExpense(){
    final expenseTitle = _titleController.text.trim();
    final expenseAmount = double.tryParse(_amountController.text);
    final expenseDate = DateTime.tryParse(_dateController.text);

    if(expenseTitle.isNotEmpty && expenseAmount != null && expenseDate != null && selectedCategory.toString().isNotEmpty){
      widget.addExpenseItem(item: ExpenseModel(title: expenseTitle, amount: expenseAmount, date: expenseDate, category: selectedCategory));
      Navigator.pop(context);
    }else{
      showDialog(
        context: context, 
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please make sure to input the valid value'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue.shade500,
                shadowColor: Colors.blue.shade200,
              ),
              onPressed: () {
                Navigator.pop(ctx);
              }, 
              child: const Text('Okay')
            )
          ],
        )
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Center(
            child: Text(
              'Add New Expense Data',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
              )
            ),
          ),
          const SizedBox(
            height: 10
          ),
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration:  InputDecoration(
              label: const Text('Title'),
              counterStyle: TextStyle(color: Colors.blue.shade500),
              floatingLabelStyle: TextStyle(color: Colors.blue.shade500),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade500),
              ),
            ),
          ),
          TextField(
            style: const TextStyle(color: Colors.black, decorationColor: Colors.black),
            controller: _amountController,
            maxLength: 50,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration:  InputDecoration(
              label: const Text('Amount Spent'),
              prefix: const Text('\$ '),
              counterStyle: TextStyle(color: Colors.blue.shade500),
              floatingLabelStyle: TextStyle(color: Colors.blue.shade500),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade500),
              ),
            ),
          ),
          TextField(
            controller: _dateController,
            style: const TextStyle(color: Colors.black, decorationColor: Colors.black),
            decoration: InputDecoration(
              label: const Text('Date'),
              counterStyle: TextStyle(color: Colors.blue.shade500),
              floatingLabelStyle: TextStyle(color: Colors.blue.shade500),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade500)
              )
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            }
          ),
          const SizedBox(
            height:15
          ),
          DropdownMenu<Category>(
            expandedInsets: const EdgeInsets.all(0),
            label: const Text('Spending Category'),
            onSelected: (Category? newValue){
              if (newValue != null) {
                setState(() {
                  selectedCategory = newValue;
                });
              }
            },
            inputDecorationTheme: InputDecorationTheme(
              floatingLabelStyle: TextStyle(color: Colors.blue.shade500),
              
            ),
            dropdownMenuEntries: Category.values.map<DropdownMenuEntry<Category>>((item) {
              return DropdownMenuEntry<Category>(
                value: item, 
                label: _capitalize(item.toString().split('.')[1]),
              );
            }).toList(),
          ),
          const SizedBox(
            height:20
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Cancel')
              ),
              const SizedBox(
                width: 10
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade500,
                  foregroundColor: Colors.white
                ),
                onPressed: (){
                  setState(() {
                    _submitExpense();
                  });
                },
                child: const Text('Save')
              )
            ],
          )
        ],
      ),
    );
  }
}