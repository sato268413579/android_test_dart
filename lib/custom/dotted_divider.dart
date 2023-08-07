import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  const DottedDivider({
    this.height = 1.0,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 4.0,
    this.dashSpace = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return Flex(
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return Expanded(
              child: SizedBox(
                width: dashWidth,
                height: height,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}