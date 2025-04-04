import 'package:flutter/material.dart';
import 'package:joongna_gazua_flutter/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_text_styles.dart';


class SkeletonAnalysisPage extends StatelessWidget {
  const SkeletonAnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Shimmer 효과를 전체 스켈레톤 화면에 적용
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: AppColors.kSkeletonElementLightColor,
        highlightColor: Colors.grey[100]!,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 분석 영역
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.kSkeletonElementLightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 300,
                    child: const SkeletonAnalysisCard(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonAnalysisCard extends StatelessWidget {
  const SkeletonAnalysisCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 750,
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.kSkeletonCardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.kSkeletonElementLightColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
    );
  }
}