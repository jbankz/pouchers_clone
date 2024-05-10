import 'package:flutter/material.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/utils/extension.dart';

class MoneyMaskedTextController extends TextEditingController {
  MoneyMaskedTextController({
    double initialValue = 0.00,
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
    this.rightSymbol = '',
    this.leftSymbol = '',
    this.precision = 2,
    this.amountColor = AppColors.kPrimaryTextColor,
    this.koboColor = AppColors.kIconGrey,
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
  final Color amountColor;
  final Color koboColor;

  // Callback function after text change
  Function(String maskedValue, double rawValue) afterChange =
      (String maskedValue, double rawValue) {};

  double _lastValue = 0.0;

  void updateValue(double value) {
    double valueToUse = value;

    // Prevent exceeding 12 digits
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

      // Set cursor position after updating text
      final cursorPosition = super.text.length - rightSymbol.length;
      selection =
          TextSelection.fromPosition(TextPosition(offset: cursorPosition));
    }
  }

  double get numberValue {
    final List<String> parts =
        _getOnlyNumbers(text).split('').toList(growable: true);

    // Insert decimal separator at the correct position
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

    // Insert thousand separators
    for (var i = precision + 4; i < textRepresentation.length; i += 4) {
      textRepresentation.insert(i, thousandSeparator);
    }

    return textRepresentation.reversed.join();
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final List<InlineSpan> children = [];

    final style = context.headlineLarge?.copyWith(
      color: amountColor,
      fontSize: 40,
      fontWeight: FontWeight.w700,
    );

    // Split text into integral and fractional parts
    if (text.contains('.')) {
      children
        ..add(TextSpan(
          style: style,
          text: text.substring(0, text.indexOf('.')),
        ))
        ..add(TextSpan(
          text: text.substring(text.indexOf('.')),
          style: style?.copyWith(color: koboColor, fontSize: 20),
        ));
    } else {
      children.add(TextSpan(style: style, text: text));
    }

    return TextSpan(style: style, children: children);
  }
}
