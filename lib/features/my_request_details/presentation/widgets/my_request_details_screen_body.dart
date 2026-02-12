import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/my_request_details/cubit/my_request_details_cubit.dart';
import 'package:citizen_service_platform/features/my_request_details/presentation/widgets/my_request_details_screen_body_file_view.dart';
import 'package:citizen_service_platform/features/my_request_details/presentation/widgets/my_request_details_screen_body_reset.dart';
import 'package:citizen_service_platform/features/my_request_details/presentation/widgets/my_request_details_screen_body_title.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/request_item_view_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRequestDetailsScreenBody extends StatelessWidget {
  const MyRequestDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    MyRequestDetailsCubit cubit = MyRequestDetailsCubit.get(context);
    RequestItem? model = cubit.state.getMyRequestDetails.data;
    num? serviceAmount = model?.serviceAmount;
    num? serviceFee = model?.serviceFee;
    num? tax = model?.tax;
    num? total = model?.totalAmount;
    List<String> files = ["file1", "file2", "file3", "file4", "file5"];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.h.gapH,
            //*================================ Info ==============================*/
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
            12.h.gapH,
            //*================================ files ==============================*/
            MyRequestDetailsScreenBodyTitle(LocaleKeys.requestAttachments.tr()),
            Column(
              spacing: 8.h,
              children: [
                for (var file in files)
                  MyRequestDetailsScreenBodyFileView(file: file),
              ],
            ),
            //*================================ Reset ==============================*/
            MyRequestDetailsScreenBodyTitle(LocaleKeys.requestAttachments.tr()),
            MyRequestDetailsScreenBodyReset(
              serviceAmount: serviceAmount,
              serviceFee: serviceFee,
              tax: tax,
              total: total,
            ),
            //*================================ Gap ==============================*/
            100.h.gapH,
          ],
        ),
      ),
    );
  }
}
