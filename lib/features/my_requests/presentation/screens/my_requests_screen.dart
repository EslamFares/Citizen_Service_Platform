import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader_gif.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/my_request_app_bar.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/my_requests_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/my_requests_cubit.dart';
import '../../data/repo/my_requests_repo.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRequestsCubit(getIt<MyRequestsRepo>())..init(),
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.imgRequsetsBg, fit: BoxFit.fill),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: AppSizes.mainBottomNavHight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyRequestAppBar(),
                  BlocBuilder<MyRequestsCubit, MyRequestsState>(
                    buildWhen: (previous, current) =>
                        current is MyRequestsLoading ||
                        current is MyRequestsSuccess ||
                        current is MyRequestsError,
                    builder: (context, state) {
                      if (state is MyRequestsLoading) {
                        return Expanded(child: AppLoaderGif());
                      }

                      //else if (state is MyRequestsError) {
                      //   return AppError(text: state.errorMessage);
                      // }
                      return Expanded(child: MyRequestsListView());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
