import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_list_upd.freezed.dart';
part 'coin_list_upd.g.dart';

@freezed
class CoinListInfoUpdModel with _$CoinListInfoUpdModel {
  factory CoinListInfoUpdModel({
    @JsonKey(name: 'price') required String price,
    @JsonKey(name: 'open_24h') required String change,
  }) = _CoinListInfoUpdModel;


  factory CoinListInfoUpdModel.fromJson(Map<String, dynamic> json) =>
      _$CoinListInfoUpdModelFromJson(json);
}
