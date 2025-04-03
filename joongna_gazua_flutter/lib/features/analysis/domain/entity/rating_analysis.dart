import 'package:joongna_gazua_flutter/features/analysis/domain/entity/top_word.dart';

class RatingAnalysis {
  final int reviewCount;
  final List<TopWord> topWords;

  RatingAnalysis({required this.reviewCount, required this.topWords});
}