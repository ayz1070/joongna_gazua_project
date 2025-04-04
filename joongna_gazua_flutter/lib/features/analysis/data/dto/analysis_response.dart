import 'package:joongna_gazua_flutter/features/analysis/data/dto/rating_analysis_dto.dart';

import '../../domain/entity/analysis_data.dart';


class AnalysisResponse {
  final int totalReviews;
  final Map<String, int> overallCounts;
  final Map<String, RatingAnalysisDto> analysis;

  AnalysisResponse({
    required this.totalReviews,
    required this.overallCounts,
    required this.analysis,
  });

  factory AnalysisResponse.fromJson(Map<String, dynamic> json) {
    Map<String, int> overallCounts = Map<String, int>.from(json['overall_counts']);
    Map<String, RatingAnalysisDto> analysis = {};
    json['analysis'].forEach((key, value) {
      analysis[key] = RatingAnalysisDto.fromJson(value);
    });
    return AnalysisResponse(
      totalReviews: json['total_reviews'],
      overallCounts: overallCounts,
      analysis: analysis,
    );
  }

  AnalysisData toEntity() {
    return AnalysisData(
      totalReviews: totalReviews,
      overallCounts: overallCounts,
      analysis: analysis.map((key, value) => MapEntry(key, value.toEntity())),
    );
  }
}



