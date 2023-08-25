import 'package:crypto_app/data/models/coin_details/coin_details_model.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';

class CoinDetailMapper {
  static CoinDetailsEntity toEntity(CoinDetailsModel model) {
    return CoinDetailsEntity(
      price: model.price,
      dateTime: model.dateTime,
    );
  }

  static CoinDetailsModel fromEntity(CoinDetailsEntity entity) {
    return CoinDetailsModel(
      price: entity.price,
      dateTime: entity.dateTime,
    );
  }
}
