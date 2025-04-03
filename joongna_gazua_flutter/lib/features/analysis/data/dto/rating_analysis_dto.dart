import 'package:joongna_gazua_flutter/features/analysis/data/dto/top_word_dto.dart';
import '../../domain/entity/rating_analysis.dart';

class RatingAnalysisDto {
  final int reviewCount;
  final List<TopWordDto> topWords;

  RatingAnalysisDto({required this.reviewCount, required this.topWords});

  factory RatingAnalysisDto.fromJson(Map<String, dynamic> json) {
    var list = json['top_words'] as List;
    List<TopWordDto> topWords = list.map((e) => TopWordDto.fromJson(e)).toList();
    return RatingAnalysisDto(
      reviewCount: json['review_count'],
      topWords: topWords,
    );
  }

  RatingAnalysis toEntity() {
    return RatingAnalysis(
      reviewCount: reviewCount,
      topWords: topWords.map((e) => e.toEntity()).toList(),
    );
  }
}