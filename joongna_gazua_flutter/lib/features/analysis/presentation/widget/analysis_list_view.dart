import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/analysis_module.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widget/analysis_card.dart';

class AnalysisListView extends ConsumerWidget {
  const AnalysisListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisViewModelProvider);
    final analysisData = state.analysisData!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '전체 리뷰: ${analysisData.totalReviews}개',
            style: AppTextStyles.headline3
          ),
          const SizedBox(height: 8),
          Text("2025/04/04 기준",style: AppTextStyles.body4,),
          const SizedBox(height: 16),
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