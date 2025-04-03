import '../entity/analysis_data.dart';
import '../repository/analysis_repository.dart';

class GetAnalysisUseCase {
  final AnalysisRepository repository;

  GetAnalysisUseCase({required this.repository});

  Future<AnalysisData> execute() {
    return repository.getAnalysisData();
  }
}