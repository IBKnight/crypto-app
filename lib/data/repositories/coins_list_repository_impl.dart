import 'package:crypto_app/data/datasources/remote/remote_datasource.dart';
import 'package:crypto_app/data/datasources/remote/websocket_handler.dart';
import 'package:crypto_app/data/models/coin_list/coin_list_model.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/domain/repositories/coins_list_repository.dart';

class CoinsListRepoImpl implements ICoinsListRepo {
  final WebSocketHandler webSocket = WebSocketHandler();

  @override
  Future<Stream<List<CoinListEntity>>> getTopList() async {
    webSocket.connect();
    final List<CoinListModel> coinsModels =
        await RemoteDataSource.getCoinsTopList();

    final coinListStream = webSocket.getCoinListStream(coinsModels);

    return coinListStream;
  }

  @override
  Stream<CoinDetailsEntity> getCoinDetailListWS(String coinName, int dayCount) {
    webSocket.connect();
    webSocket.addSubscribe(coinName);
    Stream<CoinDetailsEntity> streamEntity =
        webSocket.convertStream(webSocket.detailsStream);
    return streamEntity;
  }
}
