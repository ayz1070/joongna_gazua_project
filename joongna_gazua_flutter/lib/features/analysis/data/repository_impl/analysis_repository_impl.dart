import '../../domain/entity/analysis_data.dart';
import '../../domain/repository/analysis_repository.dart';
import '../data_source/analysis_data_source.dart';
import '../dto/analysis_response.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  final AnalysisDataSource dataSource;

  AnalysisRepositoryImpl({required this.dataSource});

  @override
  Future<AnalysisData> getAnalysisData() async {
    final jsonMap = await dataSource.loadAnalysisJson();
    final dto = AnalysisResponse.fromJson(jsonMap);
    return dto.toEntity();
  }
}