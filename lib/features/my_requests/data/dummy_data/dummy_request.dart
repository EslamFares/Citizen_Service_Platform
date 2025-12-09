import 'dart:math';

import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';

MyRequestsModel dummyMyRequestsModel = MyRequestsModel(
  isSuccess: true,
  data: dummyItems,
);
List<RequestItem> dummyItems = List.generate(
  dummyRequestName.length,
  // 3,
  (index) => RequestItem(
    id: index,

    serviceName: dummyRequestName[index],
    createdAt: DateTime.now()
        .copyWith(
          month: (Random().nextInt(11) + 1),
          day: (Random().nextInt(30) + 1),
        )
        .toString(),
    status: "قيد  التفيذ",

    isPaid: Random().nextBool(),
  ),
);
List dummyRequestName = [
  "طلب صيانه عامة",
  "طلب احلال  البناء",
  "طلب  بناء منزل",
  "طلب اصدار شهادة",
  "اصدار ترخيض البناء",
  "طلب رخصة ترميم مبنى",
  "طلب شهادة إتمام بناء",
  "طلب تعديل حدود قطعة أرض",
  "طلب تجديد رخصة محل تجاري",
  "طلب فصل عداد كهرباء",
  "طلب تغيير اسم المالك للعقار",
  "طلب موافقة على مخطط هندسي",
  "طلب توصيل خدمات (ماء/صرف صحي)",
  "طلب إفادة عن حالة عقار",
  "طلب تركيب لوحة إعلانية",
  "طلب إزالة مخلفات بناء",
  "طلب تصريح حفر شوارع",
  "طلب ترخيص سور أرض",
  "طلب شكوى على منشأة",
  "طلب تحويل رخصة مهنية",
];
