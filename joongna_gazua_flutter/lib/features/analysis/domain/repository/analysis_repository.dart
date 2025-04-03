
import '../entity/analysis_data.dart';

abstract class AnalysisRepository {
  Future<AnalysisData> getAnalysisData();
}