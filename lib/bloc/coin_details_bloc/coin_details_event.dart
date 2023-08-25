part of 'coin_details_bloc.dart';

@immutable
sealed class CoinDetailsEvent {}

class InitCoinDetails extends CoinDetailsEvent {
  final String coinName;

  InitCoinDetails({
    required this.coinName,
  });
}

class LoadCoinDetails extends CoinDetailsEvent {
  final int dayCount;
  final String coinName;

  LoadCoinDetails({
    required this.dayCount,
    required this.coinName,
  });
}
