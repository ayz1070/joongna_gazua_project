import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/analysis_module.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widget/analysis_card.dart';

class AnalysisListView extends ConsumerWidget {
  const AnalysisListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisViewModelProvider);
    final analysisData = state.analysisData!;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 영역: 분석 제목, 데이터 출처, 데이터 수, 날짜
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '분석',
                  style: AppTextStyles.headline3,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.storage, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '데이터 출처: 플레이 스토어',
                      style: AppTextStyles.body3,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.data_usage, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '수집 데이터 수: ${analysisData.totalReviews}개',
                      style: AppTextStyles.body3,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.date_range, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '날짜: 2025/04/04 기준',
                      style: AppTextStyles.body3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // 카드 영역: 평점별 분석 결과 카드들을 Wrap으로 나열
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: analysisData.analysis.entries.map((entry) {
              return SizedBox(
                width: 300,
                child: AnalysisCard(
                  score: entry.key,
                  ratingAnalysis: entry.value,
                  overallCount: analysisData.overallCounts[entry.key] ?? 0,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}