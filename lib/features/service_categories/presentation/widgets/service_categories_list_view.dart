import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/service_categories/cubit/service_categories_cubit.dart';
import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_model.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/service_categories_item_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCategoriesListView extends StatelessWidget {
  const ServiceCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCategoriesCubit, ServiceCategoriesState>(
      builder: (context, state) {
        final cubit = ServiceCategoriesCubit.get(context);
        List<ServiceCategoryModel> serviceCategories =
            cubit.serviceCategoriesModel?.data ?? [];
        if (serviceCategories.isEmpty) {
          return AppError(text: LocaleKeys.noDataAtTheMoment.tr());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                LocaleKeys.pleaseChooseService.tr(),
                style: AppTextStyles.font12w500Black,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 8.w,
                  children: [
                    for (var serviceCategory in serviceCategories)
                      ServiceCategoriesItemView(
                        serviceCategory: serviceCategory,
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
