import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routes/app_routers.dart';
import '../core/theme/app_themes.dart';

class ArticleApp extends StatelessWidget {
  const ArticleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: router,
          builder: (context, child) {
            return child!;
          },
        );
      },
    );
  }
}
