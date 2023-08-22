import 'package:crypto_app/bloc/coins_list_bloc/coins_list_bloc.dart';
import 'package:crypto_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_app/presentation/widgets/coins_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsTopList extends StatelessWidget {
  const CoinsTopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinsListBloc(repository: CoinsListRepoImpl())..add(LoadCoinsList()),
      child: const CoinsTopListView(),
    );
  }
}

class CoinsTopListView extends StatelessWidget {
  const CoinsTopListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsListBloc, CoinsListState>(builder: (context, state) {
      return switch (state) {
        CoinsListLoading _ => const Center(
            child: CircularProgressIndicator(),
          ),
        CoinsListLoaded _ => Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: state.coinsList.length,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return CoinsListItem(
                  coin: state.coinsList[index],
                );
              },
            ),
          ),
        CoinsListError _ => Center(child: Text(state.message)),
      };
    });
  }
}
