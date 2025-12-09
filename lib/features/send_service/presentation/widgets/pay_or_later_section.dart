import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/blur_container.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
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
      blur: 20,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<SendServiceCubit, SendServiceState>(
              listener: (context, state) {
                if (state is SendServiceSuccess) {
                  AppToast.toastificationShowSuccess(
                    LocaleKeys.sentSuccessfully.tr(),
                  );
                  // AppToast.toast(LocaleKeys.sentSuccessfully.tr());
                  if (state.isLater) {
                    context.go(AppRoutersName.mainBottomNavScreen);
                  } else {
                    context.go(AppRoutersName.mainBottomNavScreen);
                  }
                }
                if (state is SendServiceError) {
                  AppToast.toastificationShowError(state.errorMessage);
                  // AppToast.toastError(state.errorMessage);
                }
              },
              builder: (context, state) {
                // ignore: unused_local_variable
                final cubit = SendServiceCubit.get(context);
                return AppButton(
                  isLoading: state is SendServiceLoading && (state.isPaid),
                  height: 50.h,
                  margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 8.h),
                  onPressed: () {
                    cubit.sendService(isPaid: true);
                  },
                  text: LocaleKeys.pay.tr(),
                );
              },
            ),
            BlocBuilder<SendServiceCubit, SendServiceState>(
              builder: (context, state) {
                final cubit = SendServiceCubit.get(context);

                return AppButtonBorder(
                  isLoading: state is SendServiceLoading && !(state.isPaid),

                  height: 50.h,
                  margin: EdgeInsets.only(
                    left: 40.w,
                    right: 40.w,
                    top: 8.h,
                    bottom: 16.h,
                  ),
                  onPressed: () {
                    cubit.sendService(isPaid: false);
                  },
                  text: LocaleKeys.later.tr(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
