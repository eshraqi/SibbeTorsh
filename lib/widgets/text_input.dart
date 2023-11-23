import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../utils/constant.dart';

class TextInput extends StatelessWidget {
  final bool enabled;
  final String hint;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final bool obscureText;
  final TextAlign textAlign;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSave;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final int? maxLength;
  final String? initialValue;
  final String? label;
  final Widget? labelIcon;
  final double radius;
  final Color? fillColor;
  final Color? focusColor;
  final Color borderSideColor;
  final TextStyle? textStyle;
  final GestureTapCallback? tapPressed;
  List<TextInputFormatter>? inputFormatters;
  FocusNode? focusNode;
  final String? optionalText;
  final int maxLines;

  TextInput({
    this.hint = '',
    this.obscureText = false,
    this.enabled = true,
    this.width = double.infinity,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textAlign = TextAlign.center,
    this.textDirection,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onSave,
    this.onChanged,
    this.controller,
    this.maxLength,
    this.initialValue,
    this.label,
    this.labelIcon,
    this.radius = 10,
    this.fillColor = AppColor.gray,
    this.focusColor = AppColor.gray,
    this.borderSideColor = AppColor.transparent,
    Key? key,
    this.textStyle,
    this.tapPressed,
    this.inputFormatters,
    this.focusNode,
    this.optionalText,
    this.maxLines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Directionality(
        textDirection: textDirection ?? Constant.appTextDirection,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              Row(
                children: [
                  Text(label!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColor.text)),
                  optionalText == null
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsetsDirectional.only(start: 2),
                          child: Text(optionalText!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColor.grayText))),
                  if (labelIcon != null) ...[const SizedBox(width: 6), labelIcon!]
                ],
              ),
              const SizedBox(height: 8),
            ],
            TextFormField(
              maxLines: maxLines,
              onTap: tapPressed,
              enabled: enabled,
              textDirection: textDirection ?? Constant.appTextDirection,
              validator: validator,
              onSaved: onSave,
              initialValue: initialValue,
              maxLength: maxLength,
              onChanged: onChanged,
              obscureText: obscureText,
              textInputAction: textInputAction,
              textAlign: textAlign,
              controller: controller,
              keyboardType: textInputType,
              style: textStyle ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColor.text),
              inputFormatters: inputFormatters,
              focusNode: focusNode,
              decoration: InputDecoration(
                  suffixIcon: suffixIcon != null
                      ? Container(
                          padding: const EdgeInsetsDirectional.only(end: 16, start: 12),
                          child: suffixIcon,
                        )
                      : null,
                  prefixIcon: prefixIcon != null
                      ? Container(
                          padding: const EdgeInsetsDirectional.only(start: 16, end: 12),
                          child: prefixIcon,
                        )
                      : null,
                  filled: true,
                  hintText: hint,
                  hintTextDirection: TextDirection.rtl,
                  fillColor: fillColor,
                  focusColor: focusColor,
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderSideColor), borderRadius: BorderRadius.circular(radius)),
                  hintStyle: const TextStyle(color: AppColor.grayText, fontSize: 12, fontWeight: FontWeight.w600),
                  contentPadding: EdgeInsetsDirectional.only(
                      start: prefixIcon == null ? 16 : 0,

                      ///this checks is for fix size from prefix and suffix
                      end: suffixIcon == null
                          ? prefixIcon != null
                              ? 8
                              : 16
                          : 0,
                      top: maxLines==1?8:16,
                      bottom: maxLines==1?8:16),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderSideColor), borderRadius: BorderRadius.circular(radius)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: borderSideColor), borderRadius: BorderRadius.circular(radius)),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: borderSideColor), borderRadius: BorderRadius.circular(radius)),
                  focusedErrorBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: borderSideColor), borderRadius: BorderRadius.circular(radius))),
            ),
          ],
        ),
      ),
    );
  }
}
