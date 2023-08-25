import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/presentation/pages/coin_detail_page.dart';
import 'package:crypto_app/presentation/pages/home_page.dart';
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
