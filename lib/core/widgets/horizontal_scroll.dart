import 'package:flutter/cupertino.dart';

class HorizontalScroll extends StatelessWidget {
  const HorizontalScroll({
    super.key,
    required this.children,
    this.spacing = 0,
    this.horizontalPadding = 0,
    this.verticalPadding = 0
  });

  final List<Widget> children;
  final double spacing;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding
      ),
      child: Row(
        spacing: spacing,
        children: children),
    );
  }
}
