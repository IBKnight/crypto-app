import 'package:crypto_app/bloc/coin_details_bloc/coin_details_bloc.dart';
import 'package:crypto_app/common/palette.dart';
import 'package:crypto_app/common/strings.dart';
import 'package:crypto_app/common/theme.dart';
import 'package:crypto_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/presentation/pages/loading_page.dart';
import 'package:crypto_app/presentation/widgets/custom_tab_bar.dart';
import 'package:crypto_app/presentation/widgets/price_chart.dart';
import 'package:crypto_app/presentation/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.coin.fullName} (${widget.coin.name})',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
        builder: (context, state) {
          return switch (state) {
            CoinDetailsLoading _ => const LoadingPage(),
            CoinDetailsLoadedWS _ => SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${state.currentPrice}\$',
                              style: AppTheme.detailsTitleStyle),
                          Text(
                            (state.changePct >= 0)
                                ? '+${state.changePct.toStringAsFixed(2)}%'
                                : '${state.changePct.toStringAsFixed(2)}%',
                            style: AppTheme.detailsTitleStyle.copyWith(
                              color: (state.changePct >= 0)
                                  ? Palette.green
                                  : Palette.red,
                            ),
                          ),
                        ],
                      ),
                      PriceChartView(list: state.coinsList),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          PriceWidget(
                              title: Strings.minPrice, price: state.minPrice),
                          const Expanded(child: SizedBox()),
                          PriceWidget(
                              title: Strings.maxPrice, price: state.maxPrice)
                        ],
                      ),
                      SizedBox(height: 32.h),
                      SizedBox(
                          height: 500.h,
                          child: CustomTabBar(
                            titles: [
                              Strings.news,
                              '${Strings.moreAbout} ${widget.coin.name}'
                            ],
                            content: [
                              Text(
                                Strings.entriesNotFound,
                                style: AppTheme.detailsSubtitleStyle,
                              ),
                              Text(
                                Strings.entriesNotFound,
                                style: AppTheme.detailsSubtitleStyle,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            CoinDetailsError _ => Center(child: Text(state.message)),
          };
        },
      ),
    );
  }
}
