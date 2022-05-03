import 'package:flutter/material.dart';
import 'package:math_tester/mathTask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MathCalculation(title: 'Math Tester Flutter Basics'),
    );
  }
}

class MathCalculation extends StatefulWidget {
  MathCalculation({Key? key, required this.title}) : super(key: key);
  final String title;
  final MathTask task = MathTask();

  @override
  State<MathCalculation> createState() => _MathCalculationState();
}

class _MathCalculationState extends State<MathCalculation> {
  IconData resultIcon = Icons.question_mark;
  Color resultColor = Colors.grey;
  TextStyle textStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  void newTask() {
    setState(() {
      widget.task.generateNew();
      resultIcon = Icons.question_mark;
      resultColor = Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            children: [
              const Text("Bitte berechnen Sie folgende Aufgabe."),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.task.first.toString(), style: textStyle),
                    Text(widget.task.getDisplayedOperator, style: textStyle),
                    Text(widget.task.second.toString(), style: textStyle),
                  ],
                ),
              ),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 100,
                    right: 100,
                    top: 30,
                    bottom: 10,
                  ),
                  labelText: 'Ergebnis hier eingeben...',
                ),
                onChanged: (result) {
                  setState(() {
                    bool isTrue = widget.task.validate(result);
                    if (isTrue) {
                      resultIcon = Icons.check;
                      resultColor = Colors.green;
                    } else {
                      resultIcon = Icons.close;
                      resultColor = Colors.red;
                    }
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  resultIcon,
                  color: resultColor,
                  size: 50.0,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        tooltip: 'Generate a new one...',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
