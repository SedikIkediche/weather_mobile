import 'package:flutter/cupertino.dart';

class ScrollPositionModel extends ChangeNotifier {
  double _scrollPosition;
  double get getScrollPosition => _scrollPosition;
  void setScrollPosition(double scrollPosition) {
    if (scrollPosition >= 45.0) {
      _scrollPosition = 0.0;
      notifyListeners();
    } else {
      _scrollPosition = 1.0 - (scrollPosition * 0.01 * 2.22);
      notifyListeners();
    }
  }
}
