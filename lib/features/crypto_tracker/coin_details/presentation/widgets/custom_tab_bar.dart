import 'package:crypto_app/features/common/palette.dart';
import 'package:crypto_app/features/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.titles, required this.content});

  final List<String> titles;
  final List<Widget> content;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          dividerColor: Palette.backgroundGrey,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              height: 70.h,
              child: Text(
                widget.titles[0],
                style: AppTheme.detailsTitleStyle.copyWith(fontSize: 20.sp),
              ),
            ),
            Tab(
              height: 70.h,
              child: Text(
                widget.titles[1],
                textAlign: TextAlign.center,
                style: AppTheme.detailsTitleStyle.copyWith(fontSize: 20.sp),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Center(
                child: widget.content[0],
              ),
              Center(
                child: widget.content[1],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
