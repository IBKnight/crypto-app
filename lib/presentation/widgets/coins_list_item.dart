import 'package:flutter/material.dart';

class CoinsListItem extends StatelessWidget {
  const CoinsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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

      ],
    );
  }
}
