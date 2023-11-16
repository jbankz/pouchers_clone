import 'package:flutter/material.dart';

class VirtualKeyPadController extends ChangeNotifier {
  final int pinCount;
  List<String> pins;

  VirtualKeyPadController({this.pinCount = 4, this.pins = const []}) {
    pins = List.generate(pinCount, (index) => '').toList();
  }

  void addPin(String pin) {
    for (int i = 0; i < pinCount; i++) {
      if (pins[i].isEmpty) {
        pins[i] = pin;
        break;
      }
    }
    notifyListeners();
  }

  void removePin() {
    for (int i = pinCount - 1; i >= 0; i--) {
      if (pins[i].isNotEmpty) {
        pins[i] = '';
        break;
      }
    }
    notifyListeners();
  }
}
