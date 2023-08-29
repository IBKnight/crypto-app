import 'package:json_annotation/json_annotation.dart';

part 'coin_list_info_model.g.dart';

@JsonSerializable()
class CoinListInfoModel {
  @JsonKey(name: 'TOSYMBOL')
  String toSymbol;

  @JsonKey(name: 'PRICE')
  double price;

  @JsonKey(name: 'CHANGEPCT24HOUR')
  double change;

  CoinListInfoModel({
    required this.toSymbol,
    required this.price,
    required this.change,
  });

  factory CoinListInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CoinListInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinListInfoModelToJson(this);
}
