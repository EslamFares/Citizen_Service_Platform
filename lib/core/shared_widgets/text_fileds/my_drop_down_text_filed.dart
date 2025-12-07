import 'package:citizen_service_platform/core/shared_widgets/text_fileds/global_text_form.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDropDownTextFiled extends StatelessWidget {
  final String? value, hintText;
  final TextStyle? hintTextStyle;
  final Widget? hintChild;
  final Widget? loadingWidget;
  final Widget? customWidget;
  final bool isloading;
  final Function(String?) onChanged;
  final Function(String?)? onSaved;
  final List<DropdownMenuItem<String>> items;
  final double? raduis;
  final Color? fillColor;
  final Color? borderColor;
  final Color? foucsBorderColor;
  final Color? errorBorderColor;
  final Color? enabledBorderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final TextStyle? labelStyle;
  final double? height;
  final double? borderRaduis;
  final String? Function(String? value)? validate;
  const MyDropDownTextFiled({
    super.key,
    this.value,
    required this.onChanged,
    this.onSaved,
    required this.items,
    this.hintChild,
    this.hintTextStyle,
    this.raduis,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
    this.boxShadow,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.loadingWidget,
    this.customWidget,
    this.isloading = false,
    this.labelStyle,
    this.borderRaduis,
    this.foucsBorderColor,
    this.errorBorderColor,
    this.enabledBorderColor,
    this.validate,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 10.h),
      padding: padding,
      width: width,
      height: isloading || customWidget != null ? (height ?? 50.h) : height,
      decoration: isloading || customWidget != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(borderRaduis ?? 6.h),
              border: Border.all(
                color: enabledBorderColor ?? AppColors.bodercolorTextFormEnable,
                width: borderWidth ?? 1.5.w,
              ),
            )
          : null,
      child:
          customWidget ??
          (isloading
              ? (loadingWidget ??
                    const Center(child: CupertinoActivityIndicator()))
              : DropdownButtonFormField2<String>(
                  isExpanded: true,
                  value: value,
                  alignment: AlignmentDirectional.bottomCenter,
                  hint:
                      hintChild ??
                      (hintText != null
                          ? MyDropDownTextFiledHintWidget(
                              hintText!,
                              hintTextStyle: hintTextStyle,
                            )
                          : null),
                  items: items,
                  validator: validate,
                  onChanged: onChanged,
                  onSaved: onSaved,
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.zero,
                  ),
                  iconStyleData: IconStyleData(
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.black45,
                    ),
                    iconSize: 24.sp,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                  ),
                  decoration: InputDecoration(
                    fillColor: fillColor ?? AppColors.textFormfillcolor,
                    filled: true, // fillColor != null ? true : false,
                    labelStyle:
                        labelStyle ??
                        TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),

                    errorStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
                    focusedBorder: outLineBorder(
                      raduis: borderRaduis,
                      width: borderWidth,
                      color: AppColors.bodercolorTextFormFoucs,
                    ),
                    errorBorder: outLineBorder(
                      color: errorBorderColor ?? Colors.red,
                      raduis: borderRaduis,
                      width: borderWidth,
                    ),
                    enabledBorder: outLineBorder(
                      color:
                          enabledBorderColor ??
                          AppColors.bodercolorTextFormEnable,
                      raduis: borderRaduis,
                      width: borderWidth,
                    ),
                    disabledBorder: outLineBorder(
                      color: AppColors.bodercolorTextFormDisable,
                      raduis: borderRaduis,
                      width: borderWidth,
                    ),
                    focusedErrorBorder: outLineBorder(
                      color:
                          foucsBorderColor ??
                          AppColors.bodercolorTextFormFoucErrors,
                      raduis: borderRaduis,
                      width: borderWidth,
                    ),
                  ),
                )),
    );
  }
}

class MyDropDownTextFiledHintWidget extends StatelessWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  const MyDropDownTextFiledHintWidget(
    this.hintText, {
    super.key,
    this.hintTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        hintText,
        style: hintTextStyle ?? AppTextStyles.font14W600Black,
      ),
    );
  }
}

class TextDropDown extends StatelessWidget {
  final String text;
  final int length;
  const TextDropDown(this.text, {super.key, this.length = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.length > length ? ("${text.substring(0, length - 2)}..") : text,
      overflow: TextOverflow.ellipsis,
    );
  }
}

//!======ex========
//  MyDropDownTextFiled(
//   // isloading: true,
//             hintChild: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(
//                 LocaleKeys.chooseEmployee.tr(),
//                 style: AppTextStyle.font14W600TextColor,
//               ),
//             ),
//             validate: AppValidator.requird,
//             items: List.generate(
//               dummyContractorsNamesTasks.length,
//               (i) => DropdownMenuItem(
//                 value: i.toString(),
//                 child: Text(
//                   dummyContractorsNamesTasks[i],
//                   style: AppTextStyle.font14W600TextColor,
//                 ),
//               ),
//             ),
//             onChanged: (p0) {
//                logger.e("p0 : $p0");
//             },
//           ),
