import 'dart:math';

/// Represents a math task that can be regenerated. It has two numerical values and an operator inbetween.
class MathTask {
  late int first;
  late int second;
  late Operators op;

  /// The constructor of a new object assigns a new task.
  MathTask() {}

  /// Reassign [first], [second], [op] to create a new task. Note that [second] will never be zero to prevent division of null
  void generateNew() {}

  /// This will stringify the enum-value of the local field [op].
  String get getDisplayedOperator {
    return '';
  }

  /// Here you will receive the result of the Task.
  double get _result {
    return 0;
  }

  /// This method is used to check if a user input was made correctly.
  bool validate(String result) {
    return false;
  }
}

enum Operators { plus, minus, multi, div }
