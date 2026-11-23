import 'package:flutter/material.dart';

class BoxShadowContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const BoxShadowContainer({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height = 120,
    this.alignment = Alignment.topLeft,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 8)
          )
        ]
      ),
      child: child
    );
  }
}