import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trashflow/themes/color_theme.dart';

class CustomRaisedButton extends StatelessWidget {
  final double? elevation;
  final double? radius;
  final bool loading;
  final void Function()? onPressed;
  final Color? color;
  final String? label;
  final Color? textColor;
  final Widget? icon;
  final bool singleItem;
  final Color? customDisabledColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  const CustomRaisedButton(
      {Key? key,
      this.elevation,
      this.radius,
      this.loading = false,
      this.onPressed,
      this.color,
      this.label,
      this.textColor,
      this.icon,
      this.padding,
      this.textStyle,
      this.customDisabledColor,
      this.singleItem = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 6),
      ),
      padding: padding,
      elevation: 0, //elevation,
      onPressed: loading ? null : onPressed,
      color: color ?? ColorTheme.newButtonColor,
      disabledColor:
          customDisabledColor ?? ColorTheme.newButtonColor.withOpacity(.3),
      child: loading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                  Theme(
                      data: ThemeData(
                          cupertinoOverrideTheme: const CupertinoThemeData(
                              brightness: Brightness.dark)),
                      child: const CupertinoActivityIndicator())
                ])
          : icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (icon != null) icon!,
                    if (icon != null)
                      const SizedBox(
                        width: 8,
                      ),
                    Text(
                      label ?? '',
                      style: textStyle ??
                          TextStyle(
                              color: textColor ?? Colors.white,
                              fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : singleItem
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          label ?? '',
                          style: textStyle ??
                              TextStyle(
                                  color: textColor ?? Colors.white,
                                  fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(label ?? '',
                                    style: textStyle ??
                                        TextStyle(
                                            color: textColor ?? Colors.white,
                                            fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center))),
                      ],
                    ),
    );
  }
}
