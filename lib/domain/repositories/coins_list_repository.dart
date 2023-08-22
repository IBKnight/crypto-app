import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';

abstract interface class CoinsListRepo{
  Future<List<CoinListEntity>> getTopList();
  //Future<List<CoinListEntity>> getTopList();
}
