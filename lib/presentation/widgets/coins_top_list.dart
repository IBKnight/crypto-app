import 'dart:developer';

import 'package:crypto_app/bloc/coins_list_bloc/coins_list_bloc.dart';
import 'package:crypto_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_app/domain/entities/coin_list/coin_list_entity.dart';
import 'package:crypto_app/presentation/widgets/coins_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsTopList extends StatelessWidget {
  const CoinsTopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoinsListBloc(repository: CoinsListRepoImpl())..add(LoadCoinsList()),
      child: const CoinsTopListView(),
    );
  }
}

class CoinsTopListView extends StatefulWidget {
  const CoinsTopListView({Key? key}) : super(key: key);

  @override
  State<CoinsTopListView> createState() => _CoinsTopListViewState();
}

class _CoinsTopListViewState extends State<CoinsTopListView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsListBloc, CoinsListState>(
        builder: (context, state) {
      return switch (state) {
        CoinsListLoading _ => const Center(
            child: CircularProgressIndicator(),
          ),
        CoinsListLoaded _ => Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder<List<CoinListEntity>>(
                stream: state.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    log("error", error: snapshot.error);
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final coinsList = snapshot.data;

                  return ListView.builder(
                    itemCount: coinsList?.length,
                    itemExtent: 65,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CoinsListItem(
                          coin: coinsList![index],
                        ),
                      );
                    },
                  );
                }),
          ),
        CoinsListError _ => Center(child: Text(state.message)),
      };
    });
  }
}
