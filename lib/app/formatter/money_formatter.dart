import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

class MoneyMaskedTextController extends TextEditingController {
  MoneyMaskedTextController({
    double initialValue = 0.00,
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
    this.rightSymbol = '',
    this.leftSymbol = '',
    this.precision = 2,
  }) : super() {
    _validateConfig();

    addListener(() {
      updateValue(numberValue);
      afterChange(text, numberValue);
    });

    updateValue(initialValue);
  }

  final String decimalSeparator;
  final String thousandSeparator;
  final String rightSymbol;
  final String leftSymbol;
  final int precision;

  Function(String maskedValue, double rawValue) afterChange =
      (String maskedValue, double rawValue) {};

  double _lastValue = 0.0;

  void updateValue(double value) {
    double valueToUse = value;

    if (value.toStringAsFixed(0).length > 12) {
      valueToUse = _lastValue;
    } else {
      _lastValue = value;
    }

    String masked = _applyMask(valueToUse);

    if (rightSymbol.isNotEmpty) {
      masked += rightSymbol;
    }

    if (leftSymbol.isNotEmpty) {
      masked = leftSymbol + masked;
    }

    if (masked != text) {
      text = masked;

      final cursorPosition = super.text.length - rightSymbol.length;
      selection =
          TextSelection.fromPosition(TextPosition(offset: cursorPosition));
    }
  }

  double get numberValue {
    final List<String> parts =
        _getOnlyNumbers(text).split('').toList(growable: true);
    parts.insert(parts.length - precision, '.');
    return double.parse(parts.join());
  }

  void _validateConfig() {
    final bool rightSymbolHasNumbers = _getOnlyNumbers(rightSymbol).isNotEmpty;
    if (rightSymbolHasNumbers) {
      throw ArgumentError("rightSymbol must not have numbers.");
    }
  }

  String _getOnlyNumbers(String text) => text.replaceAll(RegExp(r'[^\d]'), '');

  String _applyMask(double value) {
    final List<String> textRepresentation = value
        .toStringAsFixed(precision)
        .replaceAll('.', '')
        .split('')
        .reversed
        .toList(growable: true)
      ..insert(precision, decimalSeparator);

    for (var i = precision + 4; i < textRepresentation.length; i += 4) {
      textRepresentation.insert(i, thousandSeparator);
    }

    return textRepresentation.reversed.join();
  }

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    final List<InlineSpan> children = [];
    final style = context.headlineLarge?.copyWith(
        color: AppColors.kPrimaryTextColor,
        fontSize: 40,
        fontWeight: FontWeight.w700);

    if (text.contains('.')) {
      children
        ..add(
            TextSpan(style: style, text: text.substring(0, text.indexOf('.'))))
        ..add(TextSpan(
            text: text.substring(text.indexOf('.')),
            style: style?.copyWith(color: AppColors.kIconGrey, fontSize: 20)));
    } else {
      children.add(TextSpan(style: style, text: text));
    }
    return TextSpan(style: style, children: children);
  }
}
