part of 'coin_details_bloc.dart';

@immutable
sealed class CoinDetailsState {}

class CoinDetailsLoading extends CoinDetailsState {}

class CoinDetailsLoadedWS extends CoinDetailsState {
  // final Stream<CoinDetailsEntity> coinsStream;
  //
  // CoinDetailsLoadedWS(this.coinsStream);

  final List<CoinDetailsEntity> coinsList;
  final double minPrice;
  final double maxPrice;
  final double currentPrice;

  CoinDetailsLoadedWS(this.coinsList, this.minPrice, this.maxPrice, this.currentPrice);

}

class CoinDetailsError extends CoinDetailsState {
  final String message;

  CoinDetailsError(this.message);
}
