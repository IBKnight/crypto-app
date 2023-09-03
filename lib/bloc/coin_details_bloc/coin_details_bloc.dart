import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/repositories/coins_list_repository.dart';
import 'package:meta/meta.dart';

part 'coin_details_event.dart';

part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  final ICoinsListRepo repository;

  CoinDetailsBloc({required this.repository}) : super(CoinDetailsLoading()) {
    on<LoadCoinDetails>(_loadCoinWalletGraphWS);
  }

  Future<void> _loadCoinWalletGraphWS(
      LoadCoinDetails event, Emitter<CoinDetailsState> emit) async {
    try {
      Stream<CoinDetailsEntity> coinDetailsStream =
          repository.getCoinDetailListWS(event.coinName, 1);

      List<CoinDetailsEntity> list = [];

      await emit.forEach(
          coinDetailsStream.where((element) =>
              element.dateTime != DateTime.fromMicrosecondsSinceEpoch(0)),
          onData: (data) {
        list.add(data);

        final double minPrice = list
            .map((coin) => double.parse(coin.price))
            .toList()
            .reduce((value, element) => value < element ? value : element);

        final double maxPrice = list
            .map((coin) => double.parse(coin.price))
            .toList()
            .reduce((value, element) => value > element ? value : element);

        final double currentPrice = double.parse(list[list.length - 1].price);

        final double changePct =
            (double.parse(list.last.price) - double.parse(list[0].price)) /
                double.parse(list[0].price) *
                100;

        return CoinDetailsLoadedWS(
            list, minPrice, maxPrice, currentPrice, changePct);
      });
    } catch (e) {
      emit(CoinDetailsError(e.toString()));
    }
  }

}
