import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_model.dart';

ServiceCategoriesModel dummyServiceCategoriesModel = ServiceCategoriesModel(
  isSuccess: true,
  data: dummyServiceCategories,
);
List<ServiceCategoryModel> dummyServiceCategories = List.generate(
  dummyServiceCategoriesName.length,
  (index) =>
      ServiceCategoryModel(id: index, name: dummyServiceCategoriesName[index]),
);
final List<String> dummyServiceCategoriesName = [
  "إصدار ترخيص بناء",
  "شهادات الصلاحية",
  "تصريح هدم",
  "إصدار ترخيص محل تجاري",
  "تجديد ترخيص",
  "تغيير نشاط",
  "إلغاء ترخيص",
  "تصريح إشغال مؤقت",
  "رفع المخالفات",
  "تصريح هدم",
  "إصدار ترخيص محل تجاري",
  "تجديد ترخيص",
  "تغيير نشاط",
  "إلغاء ترخيص",
  "تصريح إشغال مؤقت",
  "رفع المخالفات",
];
