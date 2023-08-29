import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';

//TODO: переименовать в ICoinsTrackerRepository
abstract interface class CoinsListRepo{
  Future<List<CoinListEntity>> getTopList();
  Future<List<CoinDetailsEntity>> getCoinDetailList(String coinName, int dayCount);
  Stream<CoinDetailsEntity> getCoinDetailListWS(String coinName, int dayCount);
  //Future<List<CoinListEntity>> getTopList();
}
