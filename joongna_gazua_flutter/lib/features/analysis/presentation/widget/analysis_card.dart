import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entity/rating_analysis.dart';
import 'pie_chart_widget.dart';

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
            const SizedBox(height: 16),
            Text(
              '단어 랭킹',
              style: AppTextStyles.headline3,
            ),
            ...List.generate(ratingAnalysis.topWords.length, (index) {
              final topWord = ratingAnalysis.topWords[index];
              return ListTile(
                dense: true,
                leading: Text('${index + 1}.'),
                title: Text(topWord.word),
                trailing: Text('${topWord.frequency}회'),
              );
            }),
          ],
        ),
      ),
    );
  }
}