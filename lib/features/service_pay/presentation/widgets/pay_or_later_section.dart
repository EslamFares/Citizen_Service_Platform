import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/blur_container.dart';
import 'package:citizen_service_platform/features/service_pay/cubit/service_pay_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PayOrLaterSection extends StatelessWidget {
  const PayOrLaterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height: 135.h,
      width: double.infinity,
      borderRadius: 0,
      blur: 20,
      child: Column(
        children: [
          BlocConsumer<ServicePayCubit, ServicePayState>(
            listener: (context, state) {
              if (state is ServicePaySuccess) {}
            },
            builder: (context, state) {
              // ignore: unused_local_variable
              final cubit = ServicePayCubit.get(context);
              return AppButton(
                height: 50.h,
                margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 8.h),
                onPressed: () {},
                text: LocaleKeys.pay.tr(),
              );
            },
          ),
          AppButtonBorder(
            height: 50.h,
            margin: EdgeInsets.only(
              left: 40.w,
              right: 40.w,
              top: 8.h,
              bottom: 16.h,
            ),
            onPressed: () {
              context.go(AppRoutersName.mainBottomNavScreen);
            },
            text: LocaleKeys.later.tr(),
          ),
        ],
      ),
    );
  }
}
