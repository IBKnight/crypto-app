import 'package:crypto_app/common/api_config.dart';
import 'package:crypto_app/common/palette.dart';
import 'package:crypto_app/common/theme.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CoinsListItem extends StatelessWidget {
  const CoinsListItem({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinListEntity coin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details', extra: coin),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: AppTheme.defaultBoxDecoration,
        child: Row(
          children: [
            CircleAvatar(
              radius: 21.r,
              backgroundColor: const Color.fromRGBO(1, 1, 1, 0),
              child: Image.network(
                '${ApiConfig.cryptoCompareURL}/${coin.imageUrl}',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(coin.fullName, style: AppTheme.coinsListTitle),
                Text(
                  coin.name,
                  style: AppTheme.coinsListSubtitleStyle,
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${coin.coinInfo.price.toStringAsFixed(2)} \$',
                  style: AppTheme.coinsListTitle,
                ),
                Text(
                  (coin.coinInfo.change >= 0)
                      ? '+${coin.coinInfo.change.toStringAsFixed(2)}%'
                      : '${coin.coinInfo.change.toStringAsFixed(2)}%',
                  style: AppTheme.coinsListSubtitleStyle.copyWith(
                    color: (coin.coinInfo.change >= 0)
                        ? Palette.green
                        : Palette.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
