import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader.dart';
import 'package:citizen_service_platform/core/shared_widgets/pagination_mixin.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/my_request_details/presentation/screens/my_request_details_screen.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/request_item_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/my_requests_cubit.dart';

class MyRequestsListView extends StatefulWidget {
  const MyRequestsListView({super.key});

  @override
  State<MyRequestsListView> createState() => _MyRequestsListViewState();
}

class _MyRequestsListViewState extends State<MyRequestsListView>
    with PaginationMixin {
  @override
  Future<void> onPaginate() {
    return MyRequestsCubit.get(context).getRequests(isPagination: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestsCubit, MyRequestsState>(
      builder: (context, state) {
        MyRequestsCubit cubit = MyRequestsCubit.get(context);
        List<RequestItem> requestsList = cubit.requestsModel?.data ?? [];
        return Padding(
          padding: AppSizes.sPaddingHorizontal,
          child: RefreshIndicator(
            onRefresh: () async {
              await cubit.getRequests(isRefresh: true);
            },

            child: SingleChildScrollView(
              controller: scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  context.width.gapW,
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h, top: 10.h),
                    child: Text(
                      LocaleKeys.currentRequests.tr(),
                      style: AppTextStyles.font14w600Black,
                    ),
                  ),
                  for (int i = 0; i < requestsList.length; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: RequestItemView(
                        name: requestsList[i].serviceName,
                        code: requestsList[i].id,
                        status: requestsList[i].status,
                        time: requestsList[i].createdAt,
                        paidStatus: requestsList[i].paidStatus,
                        onPressed: () {
                          if (requestsList[i].id != null) {
                            context.push(
                              AppRoutersName.myRequestDetailsScreen,
                              extra: MyRequestDetailsScreenArgs(
                                requestId: requestsList[i].id!,
                                model: requestsList[i],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  10.h.gapH,
                  BlocBuilder<MyRequestsCubit, MyRequestsState>(
                    builder: (context, state) {
                      if (state is MyRequestsPaginate) {
                        return AppLoader();
                      }
                      return SizedBox();
                    },
                  ),
                  40.h.gapH,
                  if (cubit.isNoMorePagination)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Text(
                          LocaleKeys.noMoreRequests.tr(),
                          style: AppTextStyles.font12w500Black,
                        ),
                      ),
                    ),
                  AppSizes.mainBottomNavHight.gapH,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
