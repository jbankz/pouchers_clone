import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pouchers/utils/animations/chain_tweens.dart';

class OpacityAnimatedWidget extends StatefulWidget {
  final Widget? child;
  final List<double> _values;
  final bool enabled;
  final Duration duration;
  final Curve curve;
  final Duration delay;
  final Function(bool)? animationFinished;

  const OpacityAnimatedWidget({
    super.key,
    this.child,
    this.delay = const Duration(),
    this.curve = Curves.linear,
    this.duration = const Duration(seconds: 2),
    this.enabled = false,
    this.animationFinished,
    List<double> values = const [0, 1],
  })  : _values = values,
        assert(values.length > 1);

  OpacityAnimatedWidget.tween({
    Duration duration = const Duration(milliseconds: 500),
    double opacityEnabled = 1,
    double opacityDisabled = 0,
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
            values: [opacityDisabled, opacityEnabled]);

  List<double> get values => _values;

  @override
  createState() => _State();

  bool isAnimationEqual(OpacityAnimatedWidget other) =>
      listEquals(values, other.values) &&
      duration == other.duration &&
      curve == other.curve &&
      delay == other.delay;
}

class _State extends State<OpacityAnimatedWidget>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _createAnimations();
    _updateAnimationState();
  }

  @override
  void didUpdateWidget(OpacityAnimatedWidget oldWidget) {
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

  void _updateAnimationState() async {
    if (widget.enabled) {
      await Future.delayed(widget.delay);
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
  }

  void _createAnimations() {
    _animationController?.dispose();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (widget.animationFinished != null) {
                widget.animationFinished!(widget.enabled);
              }
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
      Opacity(opacity: _animation.value, child: widget.child);
}
