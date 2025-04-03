import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joongna_gazua_flutter/features/analysis/presentation/widget/analysis_list_view.dart';
import '../../../../core/di/analysis_module.dart';
import '../../../../core/theme/app_text_styles.dart';


class AnalysisPage extends ConsumerWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('중고나라 리뷰 분석', style: AppTextStyles.headline3),

      ),
      body: () {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return AnalysisListView();
        }
      }(),
    );
  }
}
