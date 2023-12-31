import 'package:crypto_app/features/crypto_tracker/coins_list/data/models/coin_list_info_model.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/data/models/coin_list_model.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/domain/entities/coin_list_info/coin_list_info_entity.dart';

class CoinsListMapper {
  static CoinListEntity toEntity(CoinListModel model) {
    return CoinListEntity(
      fullName: model.fullName,
      name: model.name,
      imageUrl: model.imageUrl,
      coinInfo: CoinListInfoEntity(
        price: model.rawData.price,
        change: model.rawData.change,
      ),
    );
  }

  static CoinListModel fromEntity(CoinListEntity entity) {
    return CoinListModel(
      fullName: entity.fullName,
      name: entity.name,
      imageUrl: entity.imageUrl,
      rawData: CoinListInfoModel(
        price: entity.coinInfo.price,
        change: entity.coinInfo.change,
      ),
    );
  }
}