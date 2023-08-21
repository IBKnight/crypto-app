import 'package:crypto_app/presentation/widgets/mini_chart.dart';
import 'package:flutter/material.dart';

class CoinsListItem extends StatelessWidget {
  const CoinsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
        ),
        Column(
          children: [
            Text('FullName'),
            Text('Name'),
          ],
        ),
        MiniChart(),
      ],
    );
  }
}
