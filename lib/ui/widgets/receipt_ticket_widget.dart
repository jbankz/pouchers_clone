import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptTicketWidget extends StatefulWidget {
  final Widget child;
  final Color color;
  final bool isCornerRounded;

  const ReceiptTicketWidget(
      {super.key,
      required this.child,
      this.color = Colors.white,
      this.isCornerRounded = true});

  @override
  State<ReceiptTicketWidget> createState() => _ReceiptTicketWidgetState();
}

class _ReceiptTicketWidgetState extends State<ReceiptTicketWidget> {
  @override
  Widget build(BuildContext context) => ClipPath(
        clipper: TicketClipper(),
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: widget.isCornerRounded
                  ? BorderRadius.circular(20.r)
                  : BorderRadius.circular(0.0)),
          child: widget.child,
        ),
      );
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0);

    // Define an array of positions for dynamic ovals
    final List<double> positions = [0.1, 0.3, 0.5, 0.7, 0.9];

    // Loop through the positions to add ovals to the path
    for (double position in positions) {
      _addOval(path, Offset(size.width * position, size.height), 20.0);
    }

    path.close();
    return path;
  }

  // Helper method to add oval to the path
  void _addOval(Path path, Offset center, double radius) {
    path.addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
