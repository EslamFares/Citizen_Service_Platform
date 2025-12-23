import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared/funcs/date_formate.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/login/presentation/widgets/scaffold_bg.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/invoice_details_item.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/invoice_details_title.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/money_or_free.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/pay_or_later_section.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/request_confirmed_after_payment_title_icon.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/service_fees_total_text.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/widgets/app_bar_trans.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicePayOrLaterScreen extends StatelessWidget {
  const ServicePayOrLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SendServiceCubit cubit = SendServiceCubit.get(context);
    String serviceName = cubit.serviceRequirementModel?.data?.name ?? "";

    /*------------------ amount -----------------*/
    num serviceAmount = cubit.serviceRequirementModel?.data?.serviceAmount ?? 0;
    num serviceFee = cubit.serviceRequirementModel?.data?.serviceFee ?? 0;
    num tax = cubit.serviceRequirementModel?.data?.tax ?? 0;
    num total = serviceAmount + serviceFee + tax;
    return ScaffoldBg(
      bg: Assets.imgServiceTopBottomNotEmptyCenterEmptyBg,
      appBar: appBarTrans("${LocaleKeys.pay.tr()} $serviceName"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequestConfirmedAfterPaymentTitleIcon(),
                    Center(
                      child: Image.asset(
                        Assets.imgVisaPay,
                        height: 90.h,
                        width: 140.h,
                      ),
                    ),
                    /*------------------ Total -----------------*/
                    Center(child: ServiceFeesTotalText(total: total)),

                    /*------------------ invoiceDetails -----------------*/
                    InvoiceDetailsTitle(title: LocaleKeys.invoiceDetails.tr()),
                    InvoiceDetailsItem(
                      title: LocaleKeys.serviceName.tr(),
                      serviceAmount: serviceName,
                    ),
                    InvoiceDetailsItem(
                      title: LocaleKeys.serviceType.tr(),
                      serviceAmount: "",
                    ),
                    InvoiceDetailsItem(
                      title: LocaleKeys.transactionNumber.tr(),
                      serviceAmount: "",
                    ),
                    InvoiceDetailsItem(
                      title: LocaleKeys.requestDate.tr(),
                      serviceAmount: serviceRequestDate(DateTime.now()),
                    ),

                    /*------------------ paymentDetails -----------------*/
                    8.h.gapH,
                    InvoiceDetailsTitle(title: LocaleKeys.paymentDetails.tr()),
                    InvoiceDetailsItem(
                      title: LocaleKeys.serviceValue.tr(),
                      serviceAmount: moneyOrFree(serviceAmount),
                    ),
                    InvoiceDetailsItem(
                      title: LocaleKeys.fees.tr(),
                      serviceAmount: moneyOrEmpty(serviceFee),
                    ),
                    InvoiceDetailsItem(
                      title: LocaleKeys.tax.tr(),
                      serviceAmount: moneyOrEmpty(tax),
                    ),
                    InvoiceDetailsItem(
                      title: LocaleKeys.total.tr(),
                      serviceAmount: moneyOrFree(total),
                      showDivider: false,
                      style: AppTextStyles.font14w700,
                    ),

                    /*------------------ gap -----------------*/
                    100.h.gapH,
                  ],
                ),
              ),
            ),
          ),

          PayOrLaterSection(),
        ],
      ),
    );
  }
}

String serviceRequestDate(DateTime dateTime) {
  try {
    return MyDateFormater.dateStringFromDateTime(
      dateTime,
      format: "dd/MM/yyyy",
    );
  } catch (_) {
    return "";
  }
}
