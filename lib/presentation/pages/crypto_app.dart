import 'package:crypto_app/common/palette.dart';
import 'package:crypto_app/common/router.dart';
import 'package:crypto_app/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Crypto App',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          appBarTheme: AppTheme.appBarTheme,
          scaffoldBackgroundColor: Palette.backgroundGrey
        ),
        //home: const HomePage(),
      ),
    );
  }
}
