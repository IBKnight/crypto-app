part of 'coin_details_bloc.dart';

@immutable
sealed class CoinDetailsState {}

class CoinDetailsLoading extends CoinDetailsState {}

class CoinDetailsLoaded extends CoinDetailsState {
  List<CoinDetailsEntity> coinsList;

  CoinDetailsLoaded(this.coinsList);
}
class CoinDetailsError extends CoinDetailsState {
  final String message;

  CoinDetailsError(this.message);
}
