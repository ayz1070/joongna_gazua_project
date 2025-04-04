import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entity/rating_analysis.dart';
import 'pie_chart_widget.dart';
import 'rank_item.dart';

class AnalysisCard extends StatelessWidget {
  final String score;
  final RatingAnalysis ratingAnalysis;
  final int overallCount; // overallCounts에서 해당 평점의 리뷰 개수

  const AnalysisCard({
    Key? key,
    required this.score,
    required this.ratingAnalysis,
    required this.overallCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 평점 텍스트 뒤에 overallCount를 표시
            Text(
              '평점 $score점 (${overallCount}개 리뷰)',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 240,
              child: PieChartWidget(topWords: ratingAnalysis.topWords),
            ),
            const SizedBox(height: 32),
            Text(
              '단어 TOP 랭킹',
              style: AppTextStyles.headline3,
            ),
            const SizedBox(height: 16),
            // RankItem 위젯을 사용하여 순위별 단어 항목 표시
            ...List.generate(ratingAnalysis.topWords.length, (index) {
              final topWord = ratingAnalysis.topWords[index];
              return RankItem(
                rank: index + 1,
                topWord: topWord,
              );
            }),
          ],
        ),
      ),
    );
  }
}