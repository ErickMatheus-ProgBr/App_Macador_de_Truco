import 'package:flutter/material.dart';

class AnimatedProvider extends ChangeNotifier {
  bool _isSoundEnabled = true;
  int _maxPoints = 12;

  bool get isSoundEnabled => _isSoundEnabled;
  int get maxPoints => _maxPoints;

  void toggleSound() {
    _isSoundEnabled = !_isSoundEnabled;
    notifyListeners();
  }

  void setMaxPoints(int points) {
    _maxPoints = points;
    notifyListeners();
  }
}
