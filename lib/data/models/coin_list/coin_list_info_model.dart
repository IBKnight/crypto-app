import 'package:json_annotation/json_annotation.dart';

part 'coin_list_info_model.g.dart';


@JsonSerializable()
class CoinListInfoModel {

  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @JsonKey(name: 'PRICE')
  final double price;

  @JsonKey(name: 'CHANGEPCT24HOUR')
  final double change;

  CoinListInfoModel(
      {required this.toSymbol,
      required this.price,
      required this.change});

factory CoinListInfoModel.fromJson(Map<String, dynamic> json) => _$CoinListInfoModelFromJson(json);

/// Connect the generated [_$PersonToJson] function to the `toJson` method.
Map<String, dynamic> toJson() => _$CoinListInfoModelToJson(this);
}