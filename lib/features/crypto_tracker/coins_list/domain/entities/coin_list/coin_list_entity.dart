import 'package:crypto_app/features/crypto_tracker/coins_list/domain/entities/coin_list_info/coin_list_info_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'coin_list_entity.freezed.dart';

@freezed
class CoinListEntity with _$CoinListEntity{

  factory CoinListEntity({
    required String fullName,
    required String name,
    required String imageUrl,
    required CoinListInfoEntity coinInfo,
  }) = _CoinListEntity;

}