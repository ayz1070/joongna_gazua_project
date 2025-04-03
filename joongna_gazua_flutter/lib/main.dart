import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/analysis/presentation/page/analysis_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '리뷰 분석 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnalysisPage(),
    );
  }
}

