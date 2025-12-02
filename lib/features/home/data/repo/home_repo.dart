import '../../../../core/network/api/api_consumer.dart';

class HomeRepo{
  final  ApiConsumer api ;
  HomeRepo(this.api);
  //=====================
  go() async {
    // final res = await api.get(path: 'users');
    // debugPrint('res: $res');
  }
}
