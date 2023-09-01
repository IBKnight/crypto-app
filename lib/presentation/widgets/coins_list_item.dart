import 'package:crypto_app/common/palette.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:flutter/material.dart';
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
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromRGBO(1, 1, 1, 0),
            child: Image.network(
              'https://www.cryptocompare.com/${coin.imageUrl}',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(coin.fullName),
              Text(coin.name, style: const TextStyle(color: Palette.grey),),
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '${coin.coinInfo.price.toStringAsFixed(2)} ${coin.coinInfo.toSymbol}'),
              Text(
                (coin.coinInfo.change >= 0)
                    ? '+${coin.coinInfo.change.toStringAsFixed(2)}%'
                    : '${coin.coinInfo.change.toStringAsFixed(2)}%',
                style: TextStyle(
                    color:
                        (coin.coinInfo.change >= 0) ? Palette.green : Palette.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}
