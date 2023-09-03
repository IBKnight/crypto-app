import 'package:crypto_app/features/crypto_tracker/coin_details/domain/entities/coin_detail/coin_details_entity.dart';

abstract interface class ICoinsDetailsRepo{
  Stream<CoinDetailsEntity> getCoinDetailListWS(String coinName, int dayCount);
}
