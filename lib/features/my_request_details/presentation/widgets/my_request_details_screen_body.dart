import 'package:citizen_service_platform/features/my_request_details/cubit/my_request_details_cubit.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/request_item_view_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRequestDetailsScreenBody extends StatelessWidget {
  const MyRequestDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    MyRequestDetailsCubit cubit = MyRequestDetailsCubit.get(context);
    RequestItem? model = cubit.state.getMyRequestDetails.data;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: RequestItemViewInfo(
              serviceName: model?.serviceName,
              id: model?.id,
              status: model?.status,
              createdAt: model?.createdAt,
              paidStatus: model?.paidStatus,
            ),
          ),
        ],
      ),
    );
  }
}
