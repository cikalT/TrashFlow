import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trashflow/themes/color_theme.dart';
import 'package:trashflow/themes/style_theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final double? elevation;
  final double? radius;
  final bool loading;
  final void Function()? onPressed;
  final Color? color;
  final String? label;
  final Color? textColor;
  final Icon? icon;
  final bool setCustomIcon;
  final Widget? customIcon;
  final bool filled;
  final bool singleItem;
  final TextStyle? textStyle;
  const CustomOutlineButton(
      {Key? key,
      this.elevation,
      this.radius,
      this.loading = false,
      this.onPressed,
      this.color,
      this.label,
      this.textColor,
      this.icon,
      this.filled = false,
      this.textStyle,
      this.singleItem = true,
      this.customIcon,
      this.setCustomIcon = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 6),
          side: BorderSide(color: color ?? ColorTheme.newButtonColor)),
      elevation: 0,
      onPressed: loading ? null : onPressed,
      color: filled ? color ?? ColorTheme.newButtonColor : Colors.transparent,
      disabledColor:
          loading == false ? ColorTheme.whiteColor : ColorTheme.lightGreyColor,
      disabledElevation: 0,
      disabledTextColor: textColor ?? ColorTheme.newSeparatorColor,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      child: loading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [CupertinoActivityIndicator()])
          : setCustomIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    customIcon != null
                        ? Container(
                            child: customIcon,
                          )
                        : Container(),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      label ?? '',
                      style: (textStyle ?? StyleTheme.textSmallTs).copyWith(
                        color: filled
                            ? Colors.white
                            : onPressed == null
                                ? ColorTheme.newSeparatorColor
                                : textColor ?? ColorTheme.newButtonColor,
                      ),
                    ),
                  ],
                )
              : icon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) icon!,
                        if (icon != null)
                          const SizedBox(
                            width: 8,
                          ),
                        loading
                            ? const SizedBox(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator())
                            : Text(
                                label ?? '',
                                style: StyleTheme.textSmallTs.copyWith(
                                    color: filled
                                        ? Colors.white
                                        : onPressed == null
                                            ? ColorTheme.newButtonColor
                                            : textColor ??
                                                ColorTheme.newButtonColor,
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
                              style: (textStyle ?? StyleTheme.textSmallTs)
                                  .copyWith(
                                      color: filled
                                          ? Colors.white
                                          : onPressed == null
                                              ? ColorTheme.newSeparatorColor
                                              : textColor ??
                                                  ColorTheme.newButtonColor,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: Text(
                              label ?? '',
                              style: (textStyle ?? StyleTheme.textSmallTs)
                                  .copyWith(
                                      color: filled
                                          ? Colors.white
                                          : onPressed == null
                                              ? ColorTheme.newSeparatorColor
                                              : textColor ??
                                                  ColorTheme.newButtonColor,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ),
    );
  }
}
