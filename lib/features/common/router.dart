import 'package:crypto_app/features/crypto_tracker/coins_list/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/features/crypto_tracker/coin_details/presentation/pages/coin_detail_page.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/presentation/pages/market_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) {
              CoinListEntity coin = state.extra as CoinListEntity;
              return DetailPage(coin: coin);
            },
          ),
        ],
      ),
    ],
  );
}
