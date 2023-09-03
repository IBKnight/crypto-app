import 'package:crypto_app/features/common/palette.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/presentation/widgets/coins_top_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundGrey,
      appBar: AppBar(
        toolbarHeight: 65.h,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Market"),
      ),
      body: const Center(
        child: CoinsTopList())
    );
  }
}

