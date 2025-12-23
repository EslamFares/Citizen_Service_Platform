import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_show_dialog.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/data/model/user_helper.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../../my_requests/presentation/widgets/blur_app_bar.dart';
import '../../cubit/menu_cubit.dart';
import '../../data/repo/menu_repo.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(getIt<MenuRepo>()),
      child: ScaffoldBg(
        bg: Assets.imgServiceTopBottomNotEmptyCenterNotEmptyBg,

        body: Column(
          children: [
            BlurAppBar(LocaleKeys.menu.tr()),

            Padding(
              padding: AppSizes.sPaddingHorizontal,
              child: Column(
                children: [
                  20.h.gapH,
                  BlocConsumer<MenuCubit, MenuState>(
                    listener: (context, state) {
                      if (state is MenuSuccess) {}
                    },
                    builder: (context, state) {
                      return AppButtonBorder(
                        text: LocaleKeys.logout.tr(),
                        onPressed: () {
                          iosShowDialog(
                            context: context,
                            title: LocaleKeys.logout.tr(),
                            subTitle: LocaleKeys.areYouSure.tr(),
                            onConfirm: () {
                              UserHelper.clear();
                              context.go(AppRoutersName.loginScreen);
                            },
                          );
                        },
                      );
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
