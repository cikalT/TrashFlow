import 'package:flutter/widgets.dart';

class CustomListViewSpacing extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final Axis scrollDirection;
  const CustomListViewSpacing(
      {Key? key,
      required this.children,
      this.spacing = 0.0,
      this.scrollDirection = Axis.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      children: children
          .map((c) => Container(
                padding: EdgeInsets.all(spacing),
                child: c,
              ))
          .toList(),
    );
  }
}
