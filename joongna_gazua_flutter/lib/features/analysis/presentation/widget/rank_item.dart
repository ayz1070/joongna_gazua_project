import 'package:flutter/material.dart';
import 'package:joongna_gazua_flutter/core/theme/app_colors.dart';
import 'package:joongna_gazua_flutter/core/theme/app_text_styles.dart';
import '../../domain/entity/top_word.dart';

class RankItem extends StatelessWidget {
  final int rank;
  final TopWord topWord;

  const RankItem({Key? key, required this.rank, required this.topWord})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$rank',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // 단어 텍스트
          Expanded(
            child: Text(
              topWord.word,
              style: AppTextStyles.body3.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
            ),
          ),
          // 빈도수 텍스트
          Text(
            '${topWord.frequency}회',
            style: AppTextStyles.body3.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
