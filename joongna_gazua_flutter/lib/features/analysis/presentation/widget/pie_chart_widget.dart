import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/top_word.dart';

class PieChartWidget extends StatelessWidget {
  final List<TopWord> topWords;
  final Color baseColor;

  const PieChartWidget({
    Key? key,
    required this.topWords,
    this.baseColor = Colors.green,
  }) : super(key: key);

  List<PieChartSectionData> _buildSections() {
    int totalFrequency = topWords.fold(0, (sum, word) => sum + word.frequency);

    // 기본 색상을 HSL로 변환
    final baseHSL = HSLColor.fromColor(baseColor);
    return List.generate(topWords.length, (index) {
      final topWord = topWords[index];
      final double percentage = totalFrequency == 0
          ? 0
          : (topWord.frequency / totalFrequency) * 100;

      // 인덱스에 따라 밝기(lightness)를 조절 (예: 0.3 ~ 0.7 범위)
      double fraction = topWords.length > 1 ? index / (topWords.length - 1) : 0;
      final double lightness = 0.3 + (0.4 * fraction);
      final Color sectionColor =
      baseHSL.withLightness(lightness).toColor();

      return PieChartSectionData(
        color: sectionColor,
        value: topWord.frequency.toDouble(),
        title: '${topWord.word}\n${percentage.toStringAsFixed(1)}%',
        radius: 80,
        titleStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _buildSections(),
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }
}