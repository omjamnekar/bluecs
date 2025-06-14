class Question {
  final String text;
  final int? selectedOptionIndex;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.text,
    required this.options,
    required this.selectedOptionIndex,
    required this.correctOptionIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['text'] as String,
      options: List<String>.from(json['options'] as List),
      selectedOptionIndex: json['selectedOptionIndex'] != null
          ? json['selectedOptionIndex'] as int
          : null,
      correctOptionIndex: json['correctOptionIndex'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'options': options,
      'selectedOptionIndex': selectedOptionIndex ?? null,
      'correctOptionIndex': correctOptionIndex,
    };
  }
}
