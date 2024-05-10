import 'package:flutter/material.dart';
import 'package:pouchers/utils/animations/chain_tweens.dart';

class TapScaleAnimated extends StatefulWidget {
  final Widget? child;
  final Function onTap;
  final double scale;
  final Curve curve;
  final Duration duration;
  final HitTestBehavior behavior;

  const TapScaleAnimated(
      {super.key,
      this.child,
      required this.onTap,
      this.scale = 0.9,
      this.behavior = HitTestBehavior.deferToChild,
      this.duration = const Duration(milliseconds: 240),
      this.curve = Curves.easeIn});

  @override
  createState() => _State();
}

class _State extends State<TapScaleAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _createAnimations();
  }

  void _createAnimations() {
    _animationController?.dispose();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = chainTweens([1.0, widget.scale]).animate(
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
  Widget build(BuildContext context) => GestureDetector(
        behavior: widget.behavior,
        onTapDown: (details) {
          //print("onTapDown");
          _animationController!.forward();
        },
        onTapUp: (details) async {
          //print("onTapUp");

          await Future.delayed(Duration(
              milliseconds: (widget.duration.inMilliseconds * 0.9).floor()));
          _animationController!.reverse();
          widget.onTap();
        },
        child: Transform.scale(
          scale: _animation.value,
          child: widget.child,
        ),
      );
}
