import 'package:crypto_app/features/crypto_tracker/coin_details/data/models/coin_details_model.dart';
import 'package:crypto_app/features/crypto_tracker/coin_details/domain/entities/coin_detail/coin_details_entity.dart';

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
