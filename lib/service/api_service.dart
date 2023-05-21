import 'package:untitled/service/base_network.dart';


class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<List<dynamic>> getBeers() async{
    return BaseNetwork.getList("beers"); // get api recipes
    // "https://api.punkapi.com/v2/beers"
  }
}