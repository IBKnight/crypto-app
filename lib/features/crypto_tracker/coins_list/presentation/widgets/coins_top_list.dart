import 'package:crypto_app/features/crypto_tracker/coins_list/presentation/bloc/coins_list_bloc.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/data/repositories/coin_list_repo_impl.dart';
import 'package:crypto_app/features/common/pages/loading_page.dart';
import 'package:crypto_app/features/crypto_tracker/coins_list/presentation/widgets/coins_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        CoinsListLoading _ => const LoadingPage(),
        CoinsListLoaded _ => Padding(
            padding: EdgeInsets.all(16.0.r),
            child: ListView.builder(
              itemCount: state.coinsList.length,
              itemExtent: 70.h,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(5.0.r),
                  child: CoinsListItem(
                    coin: state.coinsList[index],
                  ),
                );
              },
            )),
        CoinsListError _ => Center(child: Text(state.message)),
      };
    });
  }
}
