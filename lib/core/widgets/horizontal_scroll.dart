import 'package:flutter/material.dart';

class HorizontalScroll extends StatefulWidget {
  
  const HorizontalScroll({
    super.key,
    required this.children,
    this.spacing = 0,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.selectedIndex = 0
  });

  final List<Widget> children;
  final double spacing;
  final double horizontalPadding;
  final double verticalPadding;
  final int? selectedIndex;

  @override
  State<HorizontalScroll> createState() => _HorizontalScrollState();
}

class _HorizontalScrollState extends State<HorizontalScroll> {
  final _selectedKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _centerSelected();
  }

  @override
  void didUpdateWidget(covariant HorizontalScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _centerSelected();
    }
  }

  void _centerSelected() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final itemContext = _selectedKey.currentContext;
      final item = itemContext?.findRenderObject();
      if (itemContext == null || item == null) return;

      Scrollable.of(itemContext).position.ensureVisible(
        item,
        alignment: 0.5,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.verticalPadding
      ),
      child: Row(
        spacing: widget.spacing,
        children: [
          for (var i = 0; i < widget.children.length; i++)
            if (i == widget.selectedIndex)
              KeyedSubtree(
                key: _selectedKey,
                child: widget.children[i]
              )
            else
              widget.children[i]
        ]
      )
    );
  }
}

// import 'package:flutter/cupertino.dart';

// class HorizontalScroll extends StatelessWidget {
//   const HorizontalScroll({
//     super.key,
//     required this.children,
//     this.spacing = 0,
//     this.horizontalPadding = 0,
//     this.verticalPadding = 0
//   });

//   final List<Widget> children;
//   final double spacing;
//   final double horizontalPadding;
//   final double verticalPadding;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       padding: EdgeInsets.symmetric(
//         horizontal: horizontalPadding,
//         vertical: verticalPadding
//       ),
//       child: Row(
//         spacing: spacing,
//         children: children),
//     );
//   }
// }
