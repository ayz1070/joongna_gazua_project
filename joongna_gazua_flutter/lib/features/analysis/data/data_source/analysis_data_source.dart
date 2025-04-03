import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

abstract class AnalysisDataSource {
  Future<Map<String, dynamic>> loadAnalysisJson();
}