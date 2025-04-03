import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/get_analysis_use_case.dart';
import '../state/analysis_state.dart';

class AnalysisViewModel extends StateNotifier<AnalysisState> {
  final GetAnalysisUseCase useCase;

  AnalysisViewModel({required this.useCase}) : super(AnalysisState(isLoading: true)) {
    fetchAnalysis();
  }

  Future<void> fetchAnalysis() async {
    try {
      final data = await useCase.execute();
      state = AnalysisState(isLoading: false, analysisData: data);
    } catch (e) {
      state = AnalysisState(isLoading: false, error: e.toString());
    }
  }
}

