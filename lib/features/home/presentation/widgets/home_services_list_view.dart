import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/home/cubit/home_cubit.dart';
import 'package:citizen_service_platform/features/home/data/model/home_model.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/app_scroll_behavior.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/services_item_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeServicesListView extends StatelessWidget {
  const HomeServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollBehavior(
      child: SingleChildScrollView(
        child: Column(
          children: [
            70.h.gapH,
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                HomeCubit cubit = HomeCubit.get(context);
                //servicesCategories
                List<ServicesItemModel> services =
                    cubit.servicesModel?.servicesModelData ?? [];
                if (services.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: 150.h),
                    child: AppError(text: LocaleKeys.noDataAtTheMoment.tr()),
                  );
                }
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: services.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 13.h,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1,
                    mainAxisExtent: 100.h,
                  ),
                  itemBuilder: (context, index) => ServicesItemView(
                    image: services[index].image,
                    title: services[index].name,
                    id: services[index].id,
                  ),
                );
              },
            ),
            50.gapH,
          ],
        ),
      ),
    );
  }
}
