import 'package:basic/quiz_app/quiz_app.dart';
import 'package:flutter/material.dart';
import 'package:basic/dice_app/dice_app.dart';
import 'package:basic/layouts/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 30, 136, 229)),
      ),
      home: const MyHomePage(title: 'Basic Apps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late CounterObject newCount; // Declare late so it can be initialized in initState
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    newCount = CounterObject();
    newCount.setCounter = 0; // Initialize counter to 2
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white
          )
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.blue.shade300,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "Dice App",
            ),
            Tab(
              text: "Quiz App",
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp, color: Colors.white),
            ),
          ]
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GradientContainer(
            widgets: <Widget> [
              SizedBox(
                child: newCount.getImageDesc(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newCount.getImageWidget(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              OverflowBar(
                children: [
                  FloatingActionButton(
                    onPressed: () {setState(() {newCount.rollDice();});},
                    tooltip: 'Roll Dice',
                    child: const Icon(Icons.question_mark_rounded),
                  ),
                ],
              )
            ]
          ),
          const Quiz(),
          const GradientContainer(
            widgets: <Widget> [
              Text('Hi'),
            ]
          ),
        ],
      )
    );
  }
}
