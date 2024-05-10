import 'package:flutter/animation.dart';

TweenSequence chainTweens(List<double> values) {
  if (values.length < 2) {
    return TweenSequence<double>([]);
  }

  final List<TweenSequenceItem<double>> items = <TweenSequenceItem<double>>[];

  var lastValue = values[0];
  for (int i = 1; i < values.length; ++i) {
    final double newValue = values[i];
    items.add(TweenSequenceItem<double>(
        tween: Tween(begin: lastValue, end: newValue), weight: 1));
    lastValue = newValue;
  }

  return TweenSequence<double>(items);
}
