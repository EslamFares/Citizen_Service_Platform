import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared/funcs/check_lang.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_show_dialog.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/login/data/model/user_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/home_cubit.dart';
import '../../data/repo/home_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logPro.error("isRtl = ${isRtl(context)}");
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.welcome.tr()),
          actions: [
            IconButton(
              onPressed: () {
                iosShowDialog(
                  context: context,
                  title: "logout",
                  subTitle: "are you sure",
                  onConfirm: () {
                    UserHelper.clear();
                    context.go(AppRoutersName.loginScreen);
                  },
                );
              },
              icon: const Icon(Icons.logout, color: Colors.red),
            ),
          ],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeSuccess) {}
          },
          builder: (context, state) {
            // ignore: unused_local_variable
            final cubit = HomeCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.width.gapW,

                Container(color: Colors.red, child: Text(LocaleKeys.home.tr())),
              ],
            );
          },
        ),
      ),
    );
  }
}
