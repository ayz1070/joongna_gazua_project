import 'package:joongna_gazua_flutter/features/analysis/domain/entity/rating_analysis.dart';

class AnalysisData {
  final int totalReviews;
  final Map<String, int> overallCounts;
  final Map<String, RatingAnalysis> analysis;

  AnalysisData({
    required this.totalReviews,
    required this.overallCounts,
    required this.analysis,
  });
}