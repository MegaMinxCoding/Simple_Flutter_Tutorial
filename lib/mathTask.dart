import 'dart:math';

/// Represents a math task that can be regenerated. It has two numerical values and an operator inbetween.
class MathTask {
  late int first;
  late int second;
  late Operators op;

  /// The constructor of a new object assigns a new task.
  MathTask() {
    generateNew();
  }

  /// Reassign [first], [second], [op] to create a new task. Note that [second] will never be zero to prevent division of null
  void generateNew() {
    var rng = Random();
    first = rng.nextInt(20 + 20) - 20; // num betweeen -20 and 20
    second = rng.nextInt(20 + 20) - 20;

    while (second == 0) {
      second = rng.nextInt(20 + 20) - 20;
    }

    op = Operators.values[rng.nextInt(Operators.values.length)];
  }

  /// This will stringify the enum-value of the local field [op].
  String get getDisplayedOperator {
    switch (op) {
      case Operators.plus:
        return "+";
      case Operators.minus:
        return "-";
      case Operators.multi:
        return "*";
      case Operators.div:
        return "/";
    }
  }

  /// Here you will receive the result of the Task.
  double get _result {
    switch (op) {
      case Operators.plus:
        return first.toDouble() + second.toDouble();
      case Operators.minus:
        return first.toDouble() - second.toDouble();
      case Operators.multi:
        return first.toDouble() * second.toDouble();
      case Operators.div:
        return first.toDouble() / second.toDouble();
    }
  }

  /// This method is used to check if a user input was made correctly.
  bool validate(String result) {
    try {
      return (double.parse(result)) == _result;
    } catch (e) {
      return false;
    }
  }
}

enum Operators { plus, minus, multi, div }
