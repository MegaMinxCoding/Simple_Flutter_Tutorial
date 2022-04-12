// ignore_for_file: constant_identifier_names

import 'dart:math';

class MathTask {
  late int first;
  late int second;
  late Operators op;

  MathTask() {
    generateNew();
  }

  void generateNew() {
    var rng = Random();
    first = rng.nextInt(20 + 20) - 20; // num betweeen -20 and 20
    second = rng.nextInt(20 + 20) - 20;

    while (second == 0) {
      second = rng.nextInt(20 + 20) - 20;
    }

    op = Operators.values[rng.nextInt(Operators.values.length)];
  }

  String getDisplayedOperator() {
    switch (op) {
      case Operators.PLUS:
        return "+";
      case Operators.MINUS:
        return "-";
      case Operators.MULTI:
        return "*";
      case Operators.DIV:
        return "/";
    }
  }

  double result() {
    switch (op) {
      case Operators.PLUS:
        return first.toDouble() + second.toDouble();
      case Operators.MINUS:
        return first.toDouble() - second.toDouble();
      case Operators.MULTI:
        return first.toDouble() * second.toDouble();
      case Operators.DIV:
        return first.toDouble() / second.toDouble();
    }
  }

  bool validate(String result) {
    try {
      return (double.parse(result)) == this.result();
    } catch (e) {
      return false;
    }
  }
}

enum Operators { PLUS, MINUS, MULTI, DIV }
