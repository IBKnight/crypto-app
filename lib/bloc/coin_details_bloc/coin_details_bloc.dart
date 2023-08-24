import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  CoinDetailsBloc() : super(CoinDetailsInitial()) {
    on<CoinDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
