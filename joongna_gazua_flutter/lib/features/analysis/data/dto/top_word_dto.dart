
import '../../domain/entity/top_word.dart';

class TopWordDto {
  final String word;
  final int frequency;

  TopWordDto({required this.word, required this.frequency});

  factory TopWordDto.fromJson(Map<String, dynamic> json) {
    return TopWordDto(
      word: json['word'],
      frequency: json['frequency'],
    );
  }

  TopWord toEntity() {
    return TopWord(word: word, frequency: frequency);
  }
}