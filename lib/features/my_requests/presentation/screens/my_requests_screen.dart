import 'package:citizen_service_platform/const/assets.dart';
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
      create: (context) => MyRequestsCubit(getIt<MyRequestsRepo>()),
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.imgRequsetsBg, fit: BoxFit.fill),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyRequestAppBar(),
                  Expanded(child: MyRequestsListView()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
