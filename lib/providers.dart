import 'package:flutter/material.dart';

class PageIndex with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  changeIndex(int val) {
    _index = val;
    notifyListeners();
  }
}
