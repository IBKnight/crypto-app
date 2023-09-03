import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_details_entity.freezed.dart';

@freezed
class CoinDetailsEntity with _$CoinDetailsEntity {
  const factory CoinDetailsEntity({
    required String price,
    required DateTime dateTime,
  }) = _CoinDetailsEntity;
}
