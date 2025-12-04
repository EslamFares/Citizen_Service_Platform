import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_border.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/send_service/data/model/send_service_screen_args.dart';
import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ServiceCategoriesItemView extends StatelessWidget {
  const ServiceCategoriesItemView({super.key, required this.serviceCategory});

  final ServiceCategoryModel serviceCategory;

  @override
  Widget build(BuildContext context) {
    return AppButtonBorder(
      onPressed: () {
        if (serviceCategory.id != null) {
          context.push(
            AppRoutersName.sendServiceScreen,
            extra: SendServiceScreenArgs(
              serviceCategoryId: serviceCategory.id!,
              serviceCategoryName: serviceCategory.name,
            ),
          );
        }
      },
      text: serviceCategory.name ?? "",
      child: Row(
        children: [
          Expanded(
            child: Text(
              serviceCategory.name ?? "",
              style: AppTextStyles.font12w500Black,
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 15.sp, color: Colors.black),
        ],
      ),
    );
  }
}
