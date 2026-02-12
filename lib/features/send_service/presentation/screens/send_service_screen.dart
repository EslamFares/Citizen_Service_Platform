import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader_gif.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/send_service/data/model/send_service_screen_args.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/send_service_screen_widgets/send_service_screen_body_read.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/navigator_after_pay.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/send_service_cubit.dart';
import '../../data/repo/send_service_repo.dart';

class SendServiceScreen extends StatelessWidget {
  final SendServiceScreenArgs args;
  const SendServiceScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendServiceCubit(getIt<SendServiceRepo>())
        ..init(
          serviceCategoryId: args.serviceCategoryId,
          serviceCategoryName: args.serviceCategoryName,
        ),
      child: ScaffoldBg(
        safeAreaBottomScreen: true,
        bg: Assets.imgServiceTopBottomNotEmptyCenterNotEmptyBg,
        appBar: appBarTrans("${args.serviceCategoryName}"),
        body: BlocConsumer<SendServiceCubit, SendServiceState>(
          listener: (context, state) {
            if (state is SendServiceSuccess) {
              navigatorAfterPay(context, isLater: state.isLater);
            }
            if (state is SendServiceError) {
              AppToast.toastificationShowError(state.errorMessage);
            }
          },
          buildWhen: (previous, current) =>
              current is GetServiceRequirementLoading ||
              current is GetServiceRequirementSuccess ||
              current is GetServiceRequirementError,
          builder: (context, state) {
            if (state is GetServiceRequirementLoading) {
              return const AppLoaderGif();
            } else if (state is GetServiceRequirementError) {
              return AppError(text: state.errorMessage);
            }
            return SendServiceScreenBodyRead();
          },
        ),
      ),
    );
  }
}
