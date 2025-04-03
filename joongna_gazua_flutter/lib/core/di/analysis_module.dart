import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joongna_gazua_flutter/features/analysis/data/data_source/analysis_static_data_source.dart';
import '../../features/analysis/data/data_source/analysis_data_source.dart';
import '../../features/analysis/data/repository_impl/analysis_repository_impl.dart';
import '../../features/analysis/domain/usecase/get_analysis_use_case.dart';
import '../../features/analysis/presentation/state/analysis_state.dart';
import '../../features/analysis/presentation/viewmodel/analysis_view_model.dart';

final analysisDataSourceProvider = Provider<AnalysisDataSource>((ref) {
  return AnalysisStaticDataSource();
});

final analysisRepositoryProvider = Provider<AnalysisRepositoryImpl>((ref) {
  final dataSource = ref.watch(analysisDataSourceProvider);
  return AnalysisRepositoryImpl(dataSource: dataSource);
});

final getAnalysisUseCaseProvider = Provider<GetAnalysisUseCase>((ref) {
  final repository = ref.watch(analysisRepositoryProvider);
  return GetAnalysisUseCase(repository: repository);
});

final analysisViewModelProvider =
StateNotifierProvider<AnalysisViewModel, AnalysisState>((ref) {
  final useCase = ref.watch(getAnalysisUseCaseProvider);
  return AnalysisViewModel(useCase: useCase);
});