import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  const CustomContainer(
      {Key? key,
      required this.child,
      this.padding,
      this.width,
      this.height,
      this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(0),
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.13),
            spreadRadius: 1.4,
            blurRadius: 4.5,
            blurStyle: BlurStyle.outer,
            offset: Offset.fromDirection(2.0),
          ),
        ],
      ),
      child: child,
    );
  }
}
