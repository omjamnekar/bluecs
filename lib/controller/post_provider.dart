import 'dart:convert';
import 'package:bluecs/models/post.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/short.dart';

final postProvider = StateNotifierProvider<PostNotifier, List<PostModel>>(
  (ref) => PostNotifier(),
);

class PostNotifier extends StateNotifier<List<PostModel>> {
  PostNotifier() : super([]) {
    loadPosts();
  }

  Future<void> loadPosts() async {
    final jsonString = await rootBundle.loadString('assets/posts.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    state = jsonList.map((e) => PostModel.fromJSON(e)).toList();
  }
}
