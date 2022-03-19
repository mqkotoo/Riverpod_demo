import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CounterProvider = ChangeNotifierProvider((ref) => Counter());

class Counter extends ChangeNotifier {
  var _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void resetCount() {
    _count = 0;
    notifyListeners();
  }
}