

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_list_info_entity.freezed.dart';

@freezed
class CoinListInfoEntity with _$CoinListInfoEntity {

  factory CoinListInfoEntity({
    required double price,
    required double change,
  }) = _CoinListInfoEntity;
}