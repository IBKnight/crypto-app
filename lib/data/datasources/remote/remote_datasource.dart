import 'package:crypto_app/data/models/coin_details/coin_details_model.dart';
import 'package:crypto_app/data/models/coin_list/coin_list_info_model.dart';
import 'package:crypto_app/data/models/coin_list/coin_list_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  static final Dio dio = Dio();

  static Future<List<CoinListModel>> getCoinsTopList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/top/totalvolfull?limit=7&tsym=USD');

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

  static Future<List<CoinDetailsModel>> getCoinDetails(
      String coinName, int dayCount) async {

    List<CoinDetailsModel> detailsList = [];

    final String fromSymbol = coinName;

    final int limit = 8 * dayCount;
    const String apiKey =
        '32dc6a1c7548897db4ce8bcc532500c0e0bb678ce4d60fcbaba7ff99d6f795ef';
    const String baseEndpoint =
        'https://min-api.cryptocompare.com/data/v2/histohour';
    final String apiUrl =
        '$baseEndpoint?fsym=$fromSymbol&tsym=USD&limit=$limit&aggregate=3&e=CCCAGG&api_key=$apiKey';

    final response = await dio.get(apiUrl);
    final data = (response.data as Map<String, dynamic>)['Data']['Data'];

    for (var item in data) {
      detailsList.add(CoinDetailsModel.fromJson(item));
    }

    return detailsList;
  }
}
