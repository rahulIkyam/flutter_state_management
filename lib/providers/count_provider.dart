

import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier{
  int _count = 50;
  int get count => _count;

  /// to make it increase, write a function.
  /// call this setCount in Floating Action Button in CountExample
  void setCount(){
    _count++;
    /// whenever I call setCount, this notifyListeners will notify setCount to increase _count
    notifyListeners();
  }
}