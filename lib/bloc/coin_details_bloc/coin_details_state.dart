part of 'coin_details_bloc.dart';

@immutable
sealed class CoinDetailsState {}

class CoinDetailsLoading extends CoinDetailsState {}

class CoinDetailsLoadedWS extends CoinDetailsState {
  Stream<CoinDetailsEntity> coinsStream;

  CoinDetailsLoadedWS(this.coinsStream);


}

class CoinDetailsError extends CoinDetailsState {
  final String message;

  CoinDetailsError(this.message);
}
