import 'dart:math';

import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';

MyRequestsModel dummyMyRequestsModel = MyRequestsModel(
  isSuccess: true,
  data: dummyItems,
);
List<RequestsItem> dummyItems = List.generate(
  dummyRequestName.length,
  (index) => RequestsItem(
    id: index,
    title: dummyRequestName[index],
    code: Random().nextInt(10000),
    time: DateTime.now()
        .copyWith(
          month: (Random().nextInt(11) + 1),
          day: (Random().nextInt(30) + 1),
        )
        .toString(),
    status: "قيد  التفيذ",

    payDone: Random().nextBool(),
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
