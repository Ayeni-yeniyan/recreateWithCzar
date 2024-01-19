import 'package:flutter/material.dart';

class InterestProvider extends ChangeNotifier {
  int _interestCount = 0;

  void increment() {
    _interestCount++;
    notifyListeners();
  }

  void decrement() {
    _interestCount--;
    notifyListeners();
  }

  int get getInterestCount {
    return _interestCount;
  }

  bool get isComplete {
    if (_interestCount >= 6) return true;
    return false;
  }
}
