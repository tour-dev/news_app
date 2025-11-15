import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_themes.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app/injection_container.dart';

void main() async {
  // intializing dependencies before running the app
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: DailyNews(),
    );
  }
}
