import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/data/cached/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'feature/articles_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); 
  await getIt<CacheHelper>().init(); 

  runApp(
    const ArticleApp(),
  );
}