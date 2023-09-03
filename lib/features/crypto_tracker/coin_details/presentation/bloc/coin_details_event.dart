part of 'coin_details_bloc.dart';

@immutable
sealed class CoinDetailsEvent {}

class LoadCoinDetails extends CoinDetailsEvent {
  final String coinName;

  LoadCoinDetails({
    required this.coinName,
  });
}
