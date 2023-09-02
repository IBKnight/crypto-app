import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_list_info_model.freezed.dart';
part 'coin_list_info_model.g.dart';

@freezed
class CoinListInfoModel with _$CoinListInfoModel {
  factory CoinListInfoModel({
    @JsonKey(name: 'PRICE') required double price,
    @JsonKey(name: 'CHANGEPCT24HOUR') required double change,
  }) = _CoinListInfoModel;


  factory CoinListInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CoinListInfoModelFromJson(json);
}
