import 'package:crypto_app/features/common/palette.dart';
import 'package:crypto_app/features/crypto_tracker/coin_details/domain/entities/coin_detail/coin_details_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceChartView extends StatelessWidget {
  const PriceChartView({Key? key, required this.list}) : super(key: key);

  final List<CoinDetailsEntity> list;

  @override
  Widget build(BuildContext context) {
    final times =
        list.map((coin) => coin.dateTime.millisecondsSinceEpoch).toList();
    final prices = list.map((coin) => double.parse(coin.price)).toList();

    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: SizedBox(
        height: 300.h,
        width: MediaQuery.of(context).size.width,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: times.length.toDouble(),
            minY: prices
                .reduce((value, element) => value < element ? value : element),
            maxY: prices
                .reduce((value, element) => value > element ? value : element),
            lineBarsData: [
              LineChartBarData(
                barWidth: 3.r,
                spots: List.generate(
                  prices.toList().length,
                  (index) => FlSpot(index.toDouble(), prices.toList()[index]),
                ),
                isCurved: false,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                color: (((prices[prices.length - 1] - prices[0]) /
                            prices[0] *
                            100) >=
                        0)
                    ? Palette.green
                    : Palette.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
