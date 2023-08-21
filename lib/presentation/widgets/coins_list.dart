import 'package:crypto_app/presentation/widgets/coins_list_item.dart';
import 'package:flutter/material.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 50,
      itemCount: 10,
      itemBuilder: (context, index) {
      return const CoinsListItem();
    },);
  }
}
