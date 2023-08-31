import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_details_model.freezed.dart';

part 'coin_details_model.g.dart';

@freezed
class CoinDetailsModel with _$CoinDetailsModel {
  @JsonSerializable(explicitToJson: true)
  factory CoinDetailsModel({
    @JsonKey(name: 'price') required String price,
    @JsonKey(name: 'time') required DateTime dateTime,
  }) = _CoinDetailsModel;

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailsModelFromJson(json);
}
// int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;
//
// DateTime _dateTimeFromJson(int milliseconds) =>
// DateTime.fromMicrosecondsSinceEpoch(milliseconds);
