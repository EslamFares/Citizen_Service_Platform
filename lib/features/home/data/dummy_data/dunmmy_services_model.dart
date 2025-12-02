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
    image: dummySerImg[index],
    name: dummySerName[index],
  ),
);
List<String> dummySerName = List.generate(length, (index) => "name $index");
List<String> dummySerImg = List.generate(
  length,
  (index) => "assets/img/Services/$index.png",
);
