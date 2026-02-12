import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/my_request_details/presentation/widgets/my_request_details_screen_body.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/blur_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../../../core/shared/bloc/state_box.dart';
import '../../cubit/my_request_details_cubit.dart';
import '../../data/repo/my_request_details_repo.dart';

part "../../data/model/my_request_details_screen_args.dart";

class MyRequestDetailsScreen extends StatelessWidget {
  final MyRequestDetailsScreenArgs args;
  const MyRequestDetailsScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyRequestDetailsCubit(getIt<MyRequestDetailsRepo>())
            ..init(requestId: args.requestId, modelDirect: args.model),
      child: ScaffoldBg(
        bg: Assets.imgServiceTopNotEmptyBottomEmptyCenterNotEmptyBg,
        safeAreaBottomScreen: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlurAppBar(LocaleKeys.requestData.tr(), isBack: true),
            Expanded(
              child: BlocConsumer<MyRequestDetailsCubit, MyRequestDetailsState>(
                listenWhen: (previous, current) =>
                    previous.getMyRequestDetails != current.getMyRequestDetails,
                listener: (context, state) {},
                buildWhen: (previous, current) =>
                    previous.getMyRequestDetails != current.getMyRequestDetails,
                builder: (context, state) {
                  // ignore: unused_local_variable
                  final cubit = MyRequestDetailsCubit.get(context);
                  if (state.getMyRequestDetails.isLoading) {
                    return AppLoader();
                  } else if (state.getMyRequestDetails.isError) {
                    return AppError(
                      text: state.getMyRequestDetails.errorMessage,
                    );
                  } else if (state.getMyRequestDetails.isSuccess) {
                    return MyRequestDetailsScreenBody();
                  } else {
                    return AppLoader();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
