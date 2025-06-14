class Short {
  final String thumbnailUrl;
  final String videoUrl;
  final String title;

  Short({
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.title,
  });

  factory Short.fromJson(Map<String, dynamic> json) {
    return Short(
      thumbnailUrl: json['thumbnailUrl'] as String,
      videoUrl: json['videoUrl'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'title': title,
    };
  }
}
