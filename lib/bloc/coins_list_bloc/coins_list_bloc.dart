import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/data/datasources/remote/websocket_handler.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/domain/repositories/coins_list_repository.dart';
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
      // List<CoinListEntity> list = await repository.getTopList();

      Stream<List<CoinListEntity>> stream = await repository.getTopList();
      emit(CoinsListLoaded(stream));
    } catch (e) {
      emit(CoinsListError(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    WebSocketHandler.close();
    super.close();
  }

}
