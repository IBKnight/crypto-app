import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/repositories/coins_list_repository.dart';
import 'package:meta/meta.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  final CoinsListRepo repository;

  CoinDetailsBloc({required this.repository}) : super(CoinDetailsLoading()) {
    on<InitCoinDetails>(_initCoinWalletGraph);
  }

  Future<void> _initCoinWalletGraph(
      InitCoinDetails event, Emitter<CoinDetailsState> emit) async {
    try {
      List<CoinDetailsEntity> list = await repository.getCoinDetailList(event.coinName, 7);

      emit(CoinDetailsLoaded(list));
    } catch (e) {
      emit(CoinDetailsError(e.toString()));
    }
  }

}
