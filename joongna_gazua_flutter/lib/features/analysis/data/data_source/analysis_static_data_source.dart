import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:joongna_gazua_flutter/features/analysis/data/data_source/analysis_data_source.dart';

// 서버에서 가져온다고 가정
class AnalysisStaticDataSource implements AnalysisDataSource {
  @override
  Future<Map<String, dynamic>> loadAnalysisJson() async {
    // 3초 지연
    await Future.delayed(const Duration(seconds: 1));

    final data = await rootBundle.loadString('lib/assets/analysis.json');
    return json.decode(data) as Map<String, dynamic>;
  }
}