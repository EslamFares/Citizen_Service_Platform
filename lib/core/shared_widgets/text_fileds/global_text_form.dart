import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextForm extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? icon;
  final bool? isPassValue;
  final int isPassLengthLetters;
  final bool isPassShowSuffix;
  final Function? onTapSuffixIconButton;
  final VoidCallback? onTap;
  final String? Function()? moreValidation;
  final EdgeInsetsGeometry? margin;
  final Widget? customSuffixIconShow;
  final Widget? customSuffixIconHide;
  final Widget? customSuffixWidget;
  final bool? isReadOnly;
  final TextInputType? keyBordType;
  final int? maxLengthLetter;
  final bool maxLengthLetterShowNum;
  final int? maxLines;
  final Function(String)? onchange;
  final Function(String)? onFieldSubmitted;
  final Color? enabledBorderColor;
  final Color? foucsBorderColor;
  final Color? foucsErrorBorderColor;
  final Color? errorBorderColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final String? Function(String? value)? validate;
  final double? borderRaduis;
  final double? borderWidth;
  final Color? fillColor;
  final double? height;
  final FocusNode? focusNode;
  //=========localization=========
  final String? showTextPassword;
  final String? hideTextPassword;
  final String? emptyValid;
  final String? atleasetValid;
  //=========borders=========
  final InputBorder? border;
  final BoxDecoration? boxDecorationContainer;
  //=========Focus=========
  final Function(PointerDownEvent)? onTapOutside;
  final bool enbleUnFocusInTapOutside;
  const GlobalTextForm({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.isPassValue,
    this.isPassLengthLetters = 6,
    this.onTapOutside,
    this.enbleUnFocusInTapOutside = true,
    this.icon,
    this.isPassShowSuffix = false,
    this.onTapSuffixIconButton,
    this.onTap,
    this.onchange,
    this.onFieldSubmitted,
    this.moreValidation,
    this.margin,
    this.customSuffixIconShow,
    this.customSuffixIconHide,
    this.customSuffixWidget,
    this.isReadOnly,
    this.keyBordType,
    this.maxLengthLetter,
    this.maxLengthLetterShowNum = true,
    this.maxLines,
    this.enabledBorderColor,
    this.labelStyle,
    this.hintStyle,
    this.showTextPassword,
    this.hideTextPassword,
    this.emptyValid,
    this.atleasetValid,
    this.validate,
    this.borderRaduis,
    this.borderWidth,
    this.foucsBorderColor,
    this.fillColor,
    this.errorBorderColor,
    this.height,
    this.textStyle,
    this.focusNode,
    this.foucsErrorBorderColor,
    this.border,
    this.boxDecorationContainer,
  });

  @override
  State<GlobalTextForm> createState() => _GlobalTextFormState();
}

class _GlobalTextFormState extends State<GlobalTextForm> {
  bool isObscureText = false;

  @override
  void initState() {
    isObscureText = widget.isPassShowSuffix;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: widget.margin ?? EdgeInsets.only(top: 10.h),
      decoration: widget.boxDecorationContainer,
      child: TextFormField(
        focusNode: widget.focusNode,
        onTapOutside:
            widget.onTapOutside ??
            (event) {
              if (widget.enbleUnFocusInTapOutside) {
                FocusScope.of(context).unfocus();
              }
            },
        style: widget.textStyle ?? TextStyle(fontSize: 16.sp),
        onChanged: widget.onchange ?? (value) {},
        onFieldSubmitted: widget.onFieldSubmitted ?? (value) {},
        readOnly: widget.isReadOnly ?? false,
        onTap: widget.onTap ?? () {},
        controller: widget.controller,
        obscureText: widget.isPassValue ?? isObscureText,
        keyboardType: widget.keyBordType ?? TextInputType.text,
        maxLength: widget.maxLengthLetter,
        maxLines: widget.maxLines ?? 1,
        validator:
            widget.validate ??
            (value) {
              if (value.toString().isEmpty) {
                return widget.emptyValid ?? "required".tr();
              } else if (widget.moreValidation != null) {
                return widget.moreValidation!();
              } else if (isObscureText) {
                if (value!.length < widget.isPassLengthLetters) {
                  return widget.atleasetValid ??
                      '${"atLeaset".tr()} ${widget.isPassLengthLetters} ${"characters".tr()}!';
                } else {
                  return null;
                }
              } else {
                return null;
              }
            },
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? AppColors.textFormfillcolor,
          filled: true, //fillColor != null ? true : false,
          helperStyle: widget.maxLengthLetterShowNum == false
              ? TextStyle(fontSize: 0)
              : null,
          prefixIcon: widget.icon,
          suffixIcon: widget.isPassShowSuffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                    if (widget.onTapSuffixIconButton != null) {
                      widget.onTapSuffixIconButton!();
                    }
                  },
                  icon:
                      widget.customSuffixIconShow != null &&
                          widget.customSuffixIconHide != null
                      ? (isObscureText
                            ? widget.customSuffixIconHide!
                            : widget.customSuffixIconShow!)
                      : Icon(
                          isObscureText
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_fill,
                          color: AppColors.grey,
                          size: 15.sp,
                        ),
                )
              : widget.customSuffixWidget,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle:
              widget.labelStyle ??
              TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
          hintStyle:
              widget.hintStyle ??
              TextStyle(
                fontSize: 15.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
          errorStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
          focusedBorder:
              widget.border ??
              outLineBorder(
                raduis: widget.borderRaduis,
                width: widget.borderWidth,
                color:
                    widget.foucsBorderColor ??
                    AppColors.bodercolorTextFormFoucs,
              ),
          errorBorder:
              widget.border ??
              outLineBorder(
                color: widget.errorBorderColor ?? Colors.red,
                raduis: widget.borderRaduis,
                width: widget.borderWidth,
              ),
          enabledBorder:
              widget.border ??
              outLineBorder(
                color:
                    widget.enabledBorderColor ??
                    AppColors.bodercolorTextFormEnable,
                raduis: widget.borderRaduis,
                width: widget.borderWidth,
              ),
          disabledBorder:
              widget.border ??
              outLineBorder(
                color: AppColors.bodercolorTextFormDisable,
                raduis: widget.borderRaduis,
                width: widget.borderWidth,
              ),
          focusedErrorBorder:
              widget.border ??
              outLineBorder(
                color:
                    widget.foucsErrorBorderColor ??
                    AppColors.bodercolorTextFormFoucErrors,
                raduis: widget.borderRaduis,
                width: widget.borderWidth,
              ),
        ),
      ),
    );
  }
}

OutlineInputBorder outLineBorder({
  Color? color,
  double? width,
  double? raduis,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(raduis ?? 6.h),
    borderSide: BorderSide(color: color ?? Colors.grey, width: width ?? 1.5.w),
  );
}

UnderlineInputBorder underlineInputBorder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 1.5.w),
  );
}
