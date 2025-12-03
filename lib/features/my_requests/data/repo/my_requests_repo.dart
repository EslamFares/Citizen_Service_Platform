import '../../../../core/network/api/api_consumer.dart';

class MyRequestsRepo{
  final  ApiConsumer api ;
  MyRequestsRepo(this.api);
  //=====================
  go() async {
    // final res = await api.get(path: 'users');
    // debugPrint('res: $res');
  }
}
