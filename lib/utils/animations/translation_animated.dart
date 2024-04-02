import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'chain_tweens.dart';

class TranslationAnimatedWidget extends StatefulWidget {
  final List<Offset> _values;
  final Duration duration;
  final Duration delay;
  final bool enabled;
  final Curve curve;
  final Widget child;
  final Function(bool)? animationFinished;

  TranslationAnimatedWidget.tween({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(),
    Offset translationDisabled = const Offset(0, 200),
    Offset translationEnabled = const Offset(0, 0),
    bool enabled = true,
    Function(bool)? animationFinished,
    Curve curve = Curves.linear,
    required Widget child,
  }) : this(
          duration: duration,
          enabled: enabled,
          curve: curve,
          delay: delay,
          child: child,
          animationFinished: animationFinished,
          values: [translationDisabled, translationEnabled],
        );

  const TranslationAnimatedWidget({
    super.key,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(),
    List<Offset> values = const [Offset(0, 0), Offset(0, 200)],
    this.enabled = true,
    this.curve = Curves.linear,
    this.animationFinished,
    required this.child,
  })  : _values = values,
        assert(values.length > 1);

  List<Offset> get values => _values;

  @override
  createState() => _State();

  bool isAnimationEqual(TranslationAnimatedWidget other) =>
      listEquals(values, other.values) &&
      duration == other.duration &&
      curve == other.curve &&
      delay == other.delay;
}

class _State extends State<TranslationAnimatedWidget>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> _translationXAnim;
  late Animation<double> _translationYAnim;

  @override
  void didUpdateWidget(TranslationAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimationEqual(oldWidget)) {
      if (widget.enabled != oldWidget.enabled) {
        _updateAnimationState();
      }
    } else {
      _createAnimations();
      if (widget.enabled != oldWidget.enabled) {
        _updateAnimationState();
      }
    }
  }

  Future<void> _updateAnimationState() async {
    if (widget.enabled) {
      await Future.delayed(widget.delay);
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
  }

  void _createAnimations() {
    _animationController?.dispose();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..addStatusListener((status) {
        if (widget.animationFinished != null) {
          widget.animationFinished!(widget.enabled);
        }
      });

    _translationXAnim = chainTweens(
      widget.values.map((it) => it.dx).toList(),
    ).animate(
      CurvedAnimation(parent: _animationController!, curve: widget.curve),
    ) as Animation<double>
      ..addListener(() {
        setState(() {});
      });

    _translationYAnim = chainTweens(
      widget.values.map((it) => it.dy).toList(),
    ).animate(
      CurvedAnimation(parent: _animationController!, curve: widget.curve),
    ) as Animation<double>
      ..addListener(() {
        setState(() {});
      });

    _updateAnimationState();
  }

  @override
  void initState() {
    _createAnimations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Transform.translate(
        offset: Offset(_translationXAnim.value, _translationYAnim.value),
        child: widget.child,
      );

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
