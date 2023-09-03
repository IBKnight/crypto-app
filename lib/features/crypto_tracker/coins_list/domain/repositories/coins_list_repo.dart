import 'package:crypto_app/features/crypto_tracker/coins_list/domain/entities/coin_list/coin_list_entity.dart';

abstract interface class ICoinsListRepo{
  Future<Stream<List<CoinListEntity>>> getTopList();
}
