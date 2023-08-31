import 'dart:async';

import 'package:crypto_app/bloc/coin_details_bloc/coin_details_bloc.dart';
import 'package:crypto_app/common/strings.dart';
import 'package:crypto_app/common/theme.dart';
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
        ..add(LoadCoinDetails(coinName: coin.name)),
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
  void dispose() {
    super.dispose();
  }

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
            CoinDetailsLoadedWS _ =>
                // SizedBox(),
                StreamBuilder<CoinDetailsEntity>(
                stream: state.coinsStream,
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.data != null) {
                    coinsList.add(snapshot.data as CoinDetailsEntity);
                  }
                  if (coinsList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          '${coinsList[coinsList.length - 1].price}\$',
                          style: AppTheme.detailsTitleStyle,
                        ),
                        PriceChartView(list: coinsList),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Min. price:\n ${coinsList.map((coin) => double.parse(coin.price)).toList().reduce((value, element) => value < element ? value : element)}',
                              style: AppTheme.detailsTitleStyle,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              'Max price:\n ${coinsList.map((coin) => double.parse(coin.price)).toList().reduce((value, element) => value > element ? value : element)}',
                              style: AppTheme.detailsTitleStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            CoinDetailsError _ => Center(child: Text(state.message)),
          };
        },
      ),
    );
  }
}
