import 'package:flutter/material.dart';

import 'core/data/cached/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'feature/articles_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await dotenv.load();
  setupLocator(); 
  await getIt<CacheHelper>().init(); 

  runApp(
    const ArticleApp(),
  );
}