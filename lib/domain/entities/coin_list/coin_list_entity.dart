import 'package:crypto_app/domain/entities/coin_list/coin_list_info_entity.dart';



class CoinListEntity{
  final String fullName;
  final String name;
  final String imageUrl;
  final CoinListInfoEntity coinInfo;

  CoinListEntity({
    required this.fullName,
    required this.name,
    required this.imageUrl,
    required this.coinInfo,
  });



}