import 'package:bloc/bloc.dart';
import 'package:crypto_app/data/datasources/remote/websocket_handler.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/repositories/coins_list_repository.dart';
import 'package:meta/meta.dart';

part 'coin_details_event.dart';

part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  final CoinsListRepo repository;

  CoinDetailsBloc({required this.repository}) : super(CoinDetailsLoading()) {
    on<InitCoinDetails>(_initCoinWalletGraphWS);
    // on<LoadCoinDetails>(_loadCoinWalletGraphWS);
  }

  Future<void> _initCoinWalletGraphWS(
      InitCoinDetails event, Emitter<CoinDetailsState> emit) async {
    try {
      Stream<CoinDetailsEntity> stream =
          repository.getCoinDetailListWS(event.coinName, 1);



      emit(CoinDetailsLoadedWS(stream));
    } catch (e) {
      emit(CoinDetailsError(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    WebSocketHandler.close();
    super.close();
  }
}
