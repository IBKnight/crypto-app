import 'dart:async';

import 'package:crypto_app/bloc/coin_details_bloc/coin_details_bloc.dart';
import 'package:crypto_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_app/domain/entities/coin_details/coin_details_entity.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/presentation/widgets/price_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.coin}) : super(key: key);

  final CoinListEntity coin;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinDetailsBloc(repository: CoinsListRepoImpl())
        ..add(InitCoinDetails(coinName: coin.name)),
      child: DetailPageView(
        coin: coin,
      ),
    );
  }
}

class DetailPageView extends StatefulWidget {
  const DetailPageView({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinListEntity coin;

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> {
  late final StreamSubscription<CoinDetailsEntity> sub;
  List<CoinDetailsEntity> coinsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.coin.fullName} (${widget.coin.name})'),
        centerTitle: true,
      ),
      body: BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
        builder: (context, state) {
          return switch (state) {
            CoinDetailsLoading _ => const Center(
                child: CircularProgressIndicator(),
              ),
            // CoinDetailsLoaded _ => Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               '${state.coinsList[state.coinsList.length - 1].price} \$',
            //               style: const TextStyle(fontSize: 20),
            //             ),
            //             Text(
            //                 '${((state.coinsList[state.coinsList.length - 1].price - state.coinsList[0].price) / state.coinsList[0].price * 100).toStringAsFixed(2)}%')
            //           ],
            //         ),
            //       ),
            //       const SizedBox(height: 16),
            //       PriceChartView(list: state.coinsList),
            //     ],
            //   ),
            //
            CoinDetailsLoadedWS _ => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: StreamBuilder<CoinDetailsEntity>(
                        stream: state.coinsStream,
                        builder: (context, snapshot) {
                          if (snapshot.data != null &&
                              snapshot.data!.price != 0 &&
                              snapshot.data!.dateTime != 0) {
                            coinsList.add(snapshot.data as CoinDetailsEntity);
                          }
                          if (coinsList.isEmpty) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return PriceChartView(list: coinsList);
                        }),
                  )
                ],
              ),
            CoinDetailsError _ => Center(child: Text(state.message)),
          };
        },
      ),
    );
  }
}
