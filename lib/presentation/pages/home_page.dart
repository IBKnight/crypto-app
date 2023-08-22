import 'package:crypto_app/presentation/widgets/coins_top_list.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: const Center(
        child: CoinsTopList())
    );
  }
}

