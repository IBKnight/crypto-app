part of 'coins_list_bloc.dart';

@immutable
sealed class CoinsListState {}

class CoinsListLoading extends CoinsListState {}
class CoinsListLoaded extends CoinsListState {

  Stream<List<CoinListEntity>> stream;

  // List<CoinListEntity> coinsList;

  // CoinsListLoaded(this.coinsList);

  CoinsListLoaded(this.stream);
}
class CoinsListError extends CoinsListState {
  final String message;

  CoinsListError(this.message);
}

