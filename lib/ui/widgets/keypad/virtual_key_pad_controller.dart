import 'package:flutter/material.dart';

class VirtualKeyPadController extends ChangeNotifier {
  final int pinCount;
  List<String> pins;
  final bool applyPinLength;

  VirtualKeyPadController(
      {this.pinCount = 4, this.applyPinLength = true, this.pins = const []}) {
    pins =
        applyPinLength ? List.generate(pinCount, (index) => '').toList() : [];
  }

  void addPin(String pin) {
    if (!applyPinLength) {
      pins.add(pin);
      notifyListeners();
      return;
    }

    if (applyPinLength) {
      for (int i = 0; i < pinCount; i++) {
        if (pins[i].isEmpty) {
          pins[i] = pin;
          break;
        }
      }
    }
    notifyListeners();
  }

  void clearAll() {
    for (int i = pinCount - 1; i >= 0; i--) {
      if (pins[i].isNotEmpty) {
        pins[i] = '';
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  void removePin() {
    if (!applyPinLength && pins.isNotEmpty) {
      pins.removeLast();
      notifyListeners();
      return;
    }

    if (applyPinLength) {
      for (int i = pinCount - 1; i >= 0; i--) {
        if (pins[i].isNotEmpty) {
          pins[i] = '';
          break;
        }
      }
    }
    notifyListeners();
  }
}
