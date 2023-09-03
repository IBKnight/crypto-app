import 'package:crypto_app/features/common/palette.dart';
import 'package:crypto_app/features/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.title, required this.price});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.defaultBoxDecoration.copyWith(
        borderRadius: BorderRadius.circular(16.r),
      ),
      width: 167.w,
      height: 80.w, //! С .h адаптация работает неверно
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTheme.detailsSubtitleStyle.copyWith(color: Palette.grey),
          ),
          Text(
            '$price\$',
            style: AppTheme.detailsTitleStyle.copyWith(fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
