import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/features/home/data/model/home_model.dart';

ServicesModel dummyServicesModel = ServicesModel(
  isSuccess: true,
  servicesModelData: dummyServicesModelItemList,
);
int length = 11;
List<ServicesItemModel> dummyServicesModelItemList = List.generate(
  length,
  (index) => ServicesItemModel(
    id: index,
    image: dummySerImg.length > index
        ? dummySerImg[index]
        : ("خدمة : "
              "$index"),
    name: dummySerName.length > index ? dummySerName[index] : Assets.iconsIcon,
  ),
);
// List<String> dummySerName = List.generate(length, (index) => "name $index");
String folderPath = "assets/img/services/";
List<String> dummySerImg = List.generate(
  length,
  (index) => "$folderPath${index + 1}.png",
);

List dummySerName = [
  "التراخبص",
  "الإسكان",
  "النظافة والبيئة",
  "المرافق العامة",
  "الاجتماعية",
  "الصحية",
  "التعليمية",
  "التمونية",
  "الاستثمار",
  "الطوارئ",
  "الشكاوى",
];
