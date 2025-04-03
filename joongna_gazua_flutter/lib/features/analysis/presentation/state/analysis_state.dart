import '../../domain/entity/analysis_data.dart';

class AnalysisState {
  final bool isLoading;
  final AnalysisData? analysisData;
  final String? error;

  AnalysisState({this.isLoading = false, this.analysisData, this.error});
}