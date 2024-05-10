import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'chain_tweens.dart';

class ScaleAnimatedWidget extends StatefulWidget {
  final Widget? child;
  final List<double> _values;
  final bool enabled;
  final Duration duration;
  final Curve curve;
  final Duration delay;
  final Function(bool)? animationFinished;

  const ScaleAnimatedWidget({
    super.key,
    this.child,
    this.delay = const Duration(),
    this.curve = Curves.linear,
    this.duration = const Duration(seconds: 2),
    this.animationFinished,
    this.enabled = false,
    List<double> values = const [0, 1],
  })  : _values = values,
        assert(values.length > 1);

  ScaleAnimatedWidget.tween({
    Duration duration = const Duration(milliseconds: 500),
    double scaleEnabled = 1,
    double scaleDisabled = 0,
    bool enabled = true,
    Function(bool)? animationFinished,
    Curve curve = Curves.linear,
    required Widget child,
  }) : this(
            duration: duration,
            enabled: enabled,
            curve: curve,
            child: child,
            animationFinished: animationFinished,
            values: [scaleDisabled, scaleEnabled]);

  List<double> get values => _values;

  @override
  createState() => _State();

  bool isAnimationEqual(ScaleAnimatedWidget other) =>
      listEquals(values, other.values) &&
      duration == other.duration &&
      curve == other.curve &&
      delay == other.delay;
}

class _State extends State<ScaleAnimatedWidget> with TickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _createAnimations();
    _updateAnimationState();
  }

  @override
  void didUpdateWidget(ScaleAnimatedWidget oldWidget) {
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
      vsync: this,
      duration: widget.duration,
    )..addStatusListener((status) {
        if (widget.animationFinished != null) {
          widget.animationFinished!(widget.enabled);
        }
      });

    _animation = chainTweens(widget.values).animate(
      CurvedAnimation(parent: _animationController!, curve: widget.curve),
    ) as Animation<double>
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Transform.scale(scale: _animation.value, child: widget.child);
}
