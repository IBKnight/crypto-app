import 'package:crypto_app/features/common/websocket_handler.dart';
import 'package:crypto_app/features/crypto_tracker/coin_details/domain/entities/coin_detail/coin_details_entity.dart';
import 'package:crypto_app/features/crypto_tracker/coin_details/domain/repositories/coin_details_repository.dart';

class CoinsDetailsRepoImpl implements ICoinsDetailsRepo {
  final WebSocketHandler webSocket = WebSocketHandler();

  @override
  Stream<CoinDetailsEntity> getCoinDetailListWS(String coinName, int dayCount) {
    webSocket.addSubscribe(coinName);
    Stream<CoinDetailsEntity> streamEntity =
        webSocket.convertStream(webSocket.detailsStream);
    return streamEntity;
  }
}
