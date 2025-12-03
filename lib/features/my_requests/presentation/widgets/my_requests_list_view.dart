import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/request_item_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/my_requests_cubit.dart';

class MyRequestsListView extends StatelessWidget {
  const MyRequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestsCubit, MyRequestsState>(
      builder: (context, state) {
        MyRequestsCubit cubit = MyRequestsCubit.get(context);
        List<RequestsItem> requestsList = cubit.requestsModel?.data ?? [];
        return Padding(
          padding: EdgeInsets.only(
            left: AppSizes.sPaddingHorizontalWidth,
            right: AppSizes.sPaddingHorizontalWidth,
            // top: 70.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.gapH,
                Text(
                  LocaleKeys.currentRequests.tr(),
                  style: AppTextStyles.font14w600Black,
                ),
                16.h.gapH,
                for (int i = 0; i < requestsList.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RequestItemView(
                      name: requestsList[i].title,
                      code: requestsList[i].code,
                      status: requestsList[i].status,
                      time: requestsList[i].time,
                      payStatus: requestsList[i].payStatus,
                      payDone: requestsList[i].payDone,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
