part of 'coins_list_bloc.dart';

@immutable
sealed class CoinsListEvent {}

class LoadCoinsList extends CoinsListEvent {}