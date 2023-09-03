import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/domain/repositories/coins_list_repo.dart';
import 'package:meta/meta.dart';

part 'coins_list_event.dart';

part 'coins_list_state.dart';

class CoinsListBloc extends Bloc<CoinsListEvent, CoinsListState> {
  final ICoinsListRepo repository;

  CoinsListBloc({required this.repository}) : super(CoinsListLoading()) {
    on<LoadCoinsList>(_loadCoinsList);
  }

  Future<void> _loadCoinsList(
      LoadCoinsList event, Emitter<CoinsListState> emit) async {
    try {

      Stream<List<CoinListEntity>> coinsListStream = await repository.getTopList();

      await emit.forEach(coinsListStream, onData: (data){
        return CoinsListLoaded(data);
      });

    } catch (e) {
      emit(CoinsListError(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    super.close();
  }

}
