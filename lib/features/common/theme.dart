import 'package:crypto_app/features/common/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static final TextStyle detailsTitleStyle =
      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold);

  static final TextStyle detailsSubtitleStyle =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500);

  static final TextStyle coinsListSubtitleStyle =
      TextStyle(color: Palette.grey, fontSize: 13.sp);

  static final TextStyle coinsListTitle = TextStyle(fontSize: 14.sp);

  static final BoxDecoration defaultBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15.r), color: Palette.darkGrey);

  static final AppBarTheme appBarTheme = AppBarTheme(
      iconTheme: IconThemeData(size: 30.r),
      toolbarHeight: 70.h,
      backgroundColor: Palette.backgroundGrey,
      titleTextStyle: TextStyle(fontSize: 20.sp),
      centerTitle: true);
}
