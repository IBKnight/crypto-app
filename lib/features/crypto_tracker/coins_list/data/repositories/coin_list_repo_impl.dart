import 'package:crypto_app/features/crypto_tracker/coins_list/data/datasources/remote/remote_datasource.dart';
import 'package:crypto_app/features/common/websocket_handler.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/data/models/coin_list_model.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/domain/repositories/coins_list_repo.dart';

class CoinsListRepoImpl implements ICoinsListRepo {
  final WebSocketHandler webSocket = WebSocketHandler();

  @override
  Future<Stream<List<CoinListEntity>>> getTopList() async {
    final List<CoinListModel> coinsModels =
        await RemoteDataSource.getCoinsTopList();

    final coinListStream = webSocket.getCoinListStream(coinsModels);

    return coinListStream;
  }
}
