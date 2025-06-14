import 'package:bluecs/models/user.dart';

import 'question.dart';
import 'short.dart';

class PostModel {
  final List<String> imageUrl;
  final DateTime postedAgo;
  final String title;
  final String subtitle;
  final String authorName;
  final String authorRole;
  final String authorAvatarUrl;
  final int views;
  final int likes;
  final int comments;
  final int shares;
  final bool isMuted;
  final Question? question;
  final List<Short>? shorts;
  final UserModel? user;

  bool get isQuestionPost => question != null;
  bool get isShortsPost => shorts != null && shorts!.isNotEmpty;
  bool get isImagePost =>
      imageUrl.isNotEmpty &&
      question == null &&
      (shorts == null || shorts!.isEmpty);

  PostModel({
    required this.imageUrl,
    required this.postedAgo,
    required this.title,
    required this.subtitle,
    required this.authorName,
    required this.authorRole,
    required this.authorAvatarUrl,
    required this.views,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.user,
    this.isMuted = false,
    this.question,
    this.shorts,
  });

  factory PostModel.fromJSON(Map<String, dynamic> map) {
    return PostModel(
      imageUrl:
          (map['imageUrl'] as List?)?.map((e) => e.toString()).toList() ?? [],
      postedAgo: map['postedAgo'] is String
          ? DateTime.parse(map['postedAgo'])
          : (map['postedAgo'] is DateTime ? map['postedAgo'] : DateTime.now()),
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      authorName: map['authorName'] ?? '',
      user: map["user"] != null ? UserModel.fromJson(map["user"]) : null,
      authorRole: map['authorRole'] ?? '',
      authorAvatarUrl: map['authorAvatarUrl'] ?? '',
      views: map['views'] ?? 0,
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
      shares: map['shares'] ?? 0,
      isMuted: map['isMuted'] ?? false,
      question:
          map['question'] != null ? Question.fromJson(map['question']) : null,
      shorts: (map['shorts'] as List?)
          ?.map((e) => Short.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'postedAgo': postedAgo.toIso8601String(),
      'title': title,
      'subtitle': subtitle,
      'authorName': authorName,
      'authorRole': authorRole,
      'authorAvatarUrl': authorAvatarUrl,
      'views': views,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'isMuted': isMuted,
      'user': user,
      'question': question?.toJson(),
      'shorts': shorts?.map((s) => s.toJson()).toList(),
    };
  }
}
