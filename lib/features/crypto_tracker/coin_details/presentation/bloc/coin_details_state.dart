part of 'coin_details_bloc.dart';

@immutable
sealed class CoinDetailsState {}

class CoinDetailsLoading extends CoinDetailsState {}

class CoinDetailsLoadedWS extends CoinDetailsState {
  final List<CoinDetailsEntity> coinsList;
  final double minPrice;
  final double maxPrice;
  final double currentPrice;
  final double changePct;

  CoinDetailsLoadedWS(this.coinsList, this.minPrice, this.maxPrice,
      this.currentPrice, this.changePct);
}

class CoinDetailsError extends CoinDetailsState {
  final String message;

  CoinDetailsError(this.message);
}
