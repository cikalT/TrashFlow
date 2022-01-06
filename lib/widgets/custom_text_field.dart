import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trashflow/themes/index.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final bool searchMode, transparencyMode;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextStyle? hintTextStyle;
  final int maxLines;
  final int minLines;
  final Function(String)? onChanged;
  final Function()? onTap;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool disabled;
  final String? errorText;
  final String? successText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;
  final double radius;
  final bool autoFocus;
  final bool showSuffix;
  final bool isRequiredType;
  final Color? labelColor;
  final Color? filledColor;
  final Color? filledTextColor;
  final bool enableInteractiveSelection;
  final bool paddingBottom;
  final bool ultraPaddingBottomDisable;
  final bool newMode;
  final bool borderedMode;
  final int hintMaxLines;
  final String? smallHintText;
  final TextAlign textAlign;
  final Iterable<String>? autofillHints;

  const CustomTextField(
      {Key? key,
      this.label,
      this.transparencyMode = false,
      this.hintText,
      this.hintTextStyle,
      this.controller,
      this.searchMode = false,
      this.obscureText = false,
      this.keyboardType,
      this.maxLines = 1,
      this.onChanged,
      this.minLines = 1,
      this.borderedMode = false,
      this.onTap,
      this.focusNode,
      this.textInputAction,
      this.hintMaxLines = 1,
      this.inputFormatters,
      this.disabled = false,
      this.errorText,
      this.successText,
      this.prefixIcon,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.radius = 8,
      this.autoFocus = false,
      this.showSuffix = true,
      this.labelColor,
      this.filledColor,
      this.filledTextColor,
      this.enableInteractiveSelection = true,
      this.paddingBottom = true,
      this.isRequiredType = false,
      this.ultraPaddingBottomDisable = false,
      this.newMode = false,
      this.textAlign = TextAlign.start,
      this.autofillHints,
      this.smallHintText})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!widget.isRequiredType)
          widget.label != null
              ? Text(
                  '${widget.label}',
                  style: StyleTheme.textSmallTs.copyWith(
                      color: widget.labelColor ??
                          ColorTheme.newSmallHeaderFontColor),
                )
              : Container(),
        if (widget.isRequiredType)
          widget.label != null
              ? Row(children: [
                  Text('${widget.label}',
                      style: StyleTheme.textSmallTs.copyWith(
                          color: widget.labelColor ??
                              ColorTheme.newSmallHeaderFontColor)),
                  Text('*',
                      style:
                          StyleTheme.textSmallTs.copyWith(color: Colors.red)),
                ])
              : Container(),
        widget.label != null
            ? const SizedBox(
                height: 10.0,
              )
            : Container(),
        TextFormField(
          autofillHints: widget.autofillHints,
          focusNode: widget.focusNode,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          autofocus: widget.autoFocus,
          textInputAction: widget.textInputAction,
          onTap: widget.onTap,
          style: TextStyle(color: widget.filledTextColor),
          readOnly: widget.disabled,
          controller: widget.controller,
          decoration: !widget.newMode
              ? widget.borderedMode
                  ? InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(widget.radius),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.transparencyMode
                                  ? Colors.transparent
                                  : widget.errorText != null &&
                                          widget.errorText != ''
                                      ? Colors.red
                                      : widget.searchMode
                                          ? HexColor('D9DBE9')
                                          : ColorTheme.primaryColor,
                              width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.transparencyMode
                                  ? Colors.transparent
                                  : widget.errorText != null &&
                                          widget.errorText != ''
                                      ? Colors.red
                                      : widget.searchMode
                                          ? HexColor('D9DBE9').withOpacity(.4)
                                          : ColorTheme.newSeparatorColor,
                              width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.transparencyMode
                                ? Colors.transparent
                                : Colors.red,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: widget.hintText ?? '',
                      hintMaxLines: widget.hintMaxLines,
                      hintStyle: widget.hintTextStyle ?? StyleTheme.textSmallTs,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.showSuffix ? widget.suffixIcon : null,
                      filled: widget.filledColor != null ? true : false,
                      fillColor: ColorTheme.whiteColor)
                  : InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(widget.radius),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.transparencyMode
                                  ? Colors.transparent
                                  : widget.errorText != null &&
                                          widget.errorText != ''
                                      ? Colors.red
                                      : widget.searchMode
                                          ? HexColor('D9DBE9')
                                          : ColorTheme.primaryColor,
                              width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.transparencyMode
                                  ? Colors.transparent
                                  : widget.errorText != null &&
                                          widget.errorText != ''
                                      ? Colors.red
                                      : widget.filledColor != null
                                          ? Colors.transparent
                                          : widget.searchMode
                                              ? HexColor('D9DBE9')
                                                  .withOpacity(.4)
                                              : ColorTheme.newLightGreyColor,
                              width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.transparencyMode
                                ? Colors.transparent
                                : Colors.red,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius),
                          )),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: widget.hintText ?? '',
                      hintStyle: widget.hintTextStyle ?? StyleTheme.textSmallTs,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.showSuffix ? widget.suffixIcon : null,
                      filled: widget.filledColor != null ? true : false,
                      fillColor: widget.filledColor)
              : InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              widget.errorText != null && widget.errorText != ''
                                  ? Colors.red
                                  : widget.searchMode
                                      ? HexColor('D9DBE9').withOpacity(.4)
                                      : ColorTheme.lightGreyColor,
                          width: 3.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.radius),
                      )),
                  contentPadding: const EdgeInsets.only(top: 12),
                  hintText: widget.hintText ?? '',
                  hintStyle: widget.hintTextStyle ?? StyleTheme.textSmallTs,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.showSuffix ? widget.suffixIcon : null,
                  filled: widget.filledColor != null ? true : false,
                  fillColor: Colors.transparent),
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatters,
          onFieldSubmitted: widget.onFieldSubmitted,
          textAlign: widget.textAlign,
        ),
        widget.smallHintText != null && widget.smallHintText != ''
            ? widget.errorText == null || widget.errorText == ''
                ? Padding(
                    padding:
                        EdgeInsets.only(top: 8.0, left: widget.newMode ? 6 : 0),
                    child: Text(
                      widget.smallHintText ?? '',
                      style: TextStyle(
                          fontSize: 10, color: ColorTheme.darkGreyColor),
                    ),
                  )
                : Container()
            : Container(),
        widget.errorText != null && widget.errorText!.isNotEmpty
            ? Padding(
                padding:
                    EdgeInsets.only(top: 8.0, left: widget.newMode ? 6 : 0),
                child: Text(
                  widget.errorText ?? '',
                  style: const TextStyle(fontSize: 10, color: Colors.red),
                ),
              )
            : const SizedBox.shrink(),
        widget.successText != null && widget.successText!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.successText ?? '',
                  style: const TextStyle(fontSize: 10, color: Colors.green),
                ),
              )
            : const SizedBox.shrink(),
        if (widget.paddingBottom)
          const SizedBox(
            height: 20.0,
          ),
      ],
    );
  }
}
