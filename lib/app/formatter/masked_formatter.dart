import 'package:flutter/material.dart';

class MaskedTextController extends TextEditingController {
  MaskedTextController({
    String? text,
    this.mask,
    Map<String, RegExp>? translator,
  })  : translator = translator ?? MaskedTextController.getDefaultTranslator(),
        super(text: text) {
    addListener(() {
      final previous = _lastUpdatedText;
      if (beforeChange(previous, text ?? '')) {
        updateText(text);
        afterChange(previous, text ?? '');
      } else {
        updateText(_lastUpdatedText);
      }
    });

    updateText(text);
  }

  String? mask;
  Map<String, RegExp>? translator;

  Function(String previous, String next) afterChange =
      (String previous, String next) {};
  Function(String previous, String next) beforeChange =
      (String previous, String next) => true;

  String _lastUpdatedText = '';

  void updateText(String? text) {
    this.text = _applyMask(mask ?? '', text ?? '');
    _lastUpdatedText = this.text;
  }

  void updateMask(String mask, {bool moveCursorToEnd = true}) {
    this.mask = mask;
    updateText(text);

    if (moveCursorToEnd) {
      this.moveCursorToEnd();
    }
  }

  void moveCursorToEnd() {
    final text = _lastUpdatedText;
    selection = TextSelection.fromPosition(TextPosition(offset: (text).length));
  }

  @override
  set text(String newText) {
    if (super.text != newText) {
      super.text = newText;
      moveCursorToEnd();
    }
  }

  static Map<String, RegExp> getDefaultTranslator() => {
        'A': RegExp(r'[A-Za-z]'),
        '0': RegExp(r'[0-9]'),
        '@': RegExp(r'[A-Za-z0-9]'),
        '*': RegExp(r'.*')
      };

  String _applyMask(String mask, String value) {
    String result = '';
    var maskCharIndex = 0;
    var valueCharIndex = 0;

    while (maskCharIndex < mask.length && valueCharIndex < value.length) {
      final maskChar = mask[maskCharIndex];
      final valueChar = value[valueCharIndex];

      if (maskChar == valueChar) {
        result += maskChar;
        valueCharIndex += 1;
        maskCharIndex += 1;
      } else if (translator?.containsKey(maskChar) ?? false) {
        if (translator?[maskChar]?.hasMatch(valueChar) ?? false) {
          result += valueChar;
          maskCharIndex += 1;
        }
        valueCharIndex += 1;
      } else {
        result += maskChar;
        maskCharIndex += 1;
      }
    }

    return result;
  }
}
