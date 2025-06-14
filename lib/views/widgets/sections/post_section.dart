import 'package:bluecs/controller/post_provider.dart';
import 'package:bluecs/views/widgets/post/pole/pole_main.dart';
import 'package:bluecs/views/widgets/post/post_main.dart';
import 'package:bluecs/views/widgets/post/shorts/short_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostSection extends ConsumerStatefulWidget {
  const PostSection({super.key});

  @override
  ConsumerState<PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends ConsumerState<PostSection> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postProvider);
    if (posts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      height: double.infinity,
      margin: EdgeInsets.only(left: 4, right: 4),
      child: ListView.builder(
        itemCount: posts.length,
        // separatorBuilder: (context, index) => const SizedBox(height: 2),
        itemBuilder: (context, index) {
          final post = posts[index];

          if (post.isShortsPost) {
            return ShortMain(postModel: post);
          } else if (post.isQuestionPost) {
            return PoleMain(postModel: post);
          } else {
            return PostWidget(postModel: post);
          }
        },
      ),
    );
  }
}
