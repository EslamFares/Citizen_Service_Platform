import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_validation/app_validation.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_validation/check_is_int.dart';
import 'package:easy_localization/easy_localization.dart' as eloc;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/app_utils/app_colors.dart';

class PinCodeTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool enabled;
  final int length;
  final Function(String)? onCompleted;
  const PinCodeTextFeild({
    super.key,
    required this.controller,
    this.onCompleted,
    this.autoFocus = true,
    this.enabled = true,
    this.length = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: PinCodeTextField(
          textInputAction: TextInputAction.send,
          appContext: context,
          length: 6,
          enabled: enabled,
          controller: controller,
          autoFocus: autoFocus,
          cursorColor: Colors.white,
          textStyle: AppTextStyles.font16w600Black,
          keyboardType: TextInputType.number,
          obscureText: false,
          animationType: AnimationType.scale,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8.r),
            // fieldHeight: 60.h,
            // fieldWidth: 60.h,
            borderWidth: 1.w,
            activeFillColor: AppColors.textFormfillcolor,
            selectedFillColor: AppColors.textFormfillcolor,
            inactiveFillColor: AppColors.textFormfillcolor,
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.bodercolorTextFormEnable,
            selectedColor: AppColors.bodercolorTextFormEnable,
            disabledColor: Colors.grey[500],
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          validator: (value) => AppValidator.isNumInt(value),
          onCompleted: (value) {
            if (isInteger(value)) {
              onCompleted?.call(value);
            } else {
              AppToast.toastError(LocaleKeys.enterCorrectNumber.tr());
            }
          },
        ),
      ),
    );
  }
}
