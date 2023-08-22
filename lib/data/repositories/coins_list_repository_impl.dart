import 'package:crypto_app/data/datasources/remote/remote_datasource.dart';
import 'package:crypto_app/data/mappers/coin_list_mapper.dart';
import 'package:crypto_app/data/models/coin_list/coin_list_model.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/domain/repositories/coins_list_repository.dart';

class CoinsListRepoImpl implements CoinsListRepo{
  @override
  Future<List<CoinListEntity>> getTopList() async{
    final List<CoinListModel> coinsModels = await RemoteDataSource.getCoinsTopList();
    final List<CoinListEntity> coinsEntities = coinsModels.map((coinModel) {
      return CoinsListMapper.toEntity(coinModel);
    }).toList();

    return coinsEntities;

  }

}