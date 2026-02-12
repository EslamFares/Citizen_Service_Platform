import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader_gif.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_screen_args.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/service_categories_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/service_categories_cubit.dart';
import '../../data/repo/service_categories_repo.dart';

class ServiceCategoriesScreen extends StatelessWidget {
  final ServiceCategoriesScreenArgs args;
  const ServiceCategoriesScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ServiceCategoriesCubit(getIt<ServiceCategoriesRepo>())
            ..init(serviceId: args.serviceId),
      child: ScaffoldBg(
        safeAreaBottomScreen: true,
        bg: Assets.imgServiceTopNotEmptyBottomEmptyCenterNotEmptyBg,
        appBar: appBarTrans("${LocaleKeys.services2.tr()} ${args.title}"),
        body: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            // top: AppSizes.appBarHight(context).h,
          ),
          child: BlocBuilder<ServiceCategoriesCubit, ServiceCategoriesState>(
            buildWhen: (previous, current) =>
                current is ServiceCategoriesLoading ||
                current is ServiceCategoriesSuccess ||
                current is ServiceCategoriesRefresh ||
                current is ServiceCategoriesError,
            builder: (context, state) {
              if (state is ServiceCategoriesLoading) {
                return const AppLoaderGif();
              } else if (state is ServiceCategoriesError) {
                return AppError(text: state.errorMessage);
              } else if (state is ServiceCategoriesSuccess) {
                return ServiceCategoriesListView();
              }
              return const AppLoaderGif();
            },
          ),
        ),
      ),
    );
  }
}
