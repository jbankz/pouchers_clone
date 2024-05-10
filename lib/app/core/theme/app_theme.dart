import 'package:pouchers/app/core/skeleton/theme.dart';
import 'package:flutter/cupertino.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => SkeletonTheme(
      shimmerGradient: const LinearGradient(colors: [
        Color(0xFFD8E3E7),
        Color(0xFFC8D5DA),
        Color(0xFFD8E3E7),
      ], stops: [
        0.1,
        0.5,
        0.9
      ]),
      darkShimmerGradient: const LinearGradient(colors: [
        Color(0xFF222222),
        Color(0xFF242424),
        Color(0xFF2B2B2B),
        Color(0xFF242424),
        Color(0xFF222222)
      ], stops: [
        0.0,
        0.2,
        0.5,
        0.8,
        1
      ], begin: Alignment(-2.4, -0.2), end: Alignment(2.4, 0.2)),
      child: child);
}
