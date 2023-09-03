import 'package:crypto_app/common/api_config.dart';
import 'package:crypto_app/data/models/coin_list/coin_list_info_model.dart';
import 'package:crypto_app/data/models/coin_list/coin_list_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  static final Dio dio = Dio();

  static Future<List<CoinListModel>> getCoinsTopList() async {
    final response = await dio.get(ApiConfig.coinsTopListURL);

    var coinsList = <CoinListModel>[];

    final data = (response.data as Map<String, dynamic>)['Data'];

    for (var coin in data) {
      coinsList.add(CoinListModel(
          fullName: coin['CoinInfo']['FullName'],
          name: coin['CoinInfo']['Name'],
          imageUrl: coin['CoinInfo']['ImageUrl'],
          rawData: CoinListInfoModel.fromJson(coin['RAW']['USD'])));
    }

    return coinsList;
  }
}
