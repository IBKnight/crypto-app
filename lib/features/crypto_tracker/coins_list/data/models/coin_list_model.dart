import 'package:crypto_app/features/crypto_tracker/coins_list/data/models/coin_list_info_model.dart';

class CoinListModel {
  final String fullName;
  final String name;
  final String imageUrl;
  final CoinListInfoModel rawData;

  CoinListModel(
      {required this.fullName,
      required this.name,
      required this.imageUrl,
      required this.rawData});
}
