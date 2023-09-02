import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';

abstract interface class ICoinsListRepo{
  Future<Stream<List<CoinListEntity>>> getTopList();
  Stream<CoinDetailsEntity> getCoinDetailListWS(String coinName, int dayCount);
}
