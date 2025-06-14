import 'package:bluecs/models/post.dart';
import 'package:bluecs/views/widgets/post/header_post.dart';
import 'package:bluecs/views/widgets/post/image_slider.dart';
import 'package:bluecs/views/widgets/post/pole/question_panel.dart';
import 'package:bluecs/views/widgets/post/post_profile.dart';
import 'package:bluecs/views/widgets/post/social_panel.dart';
import 'package:flutter/material.dart';

class PoleMain extends StatefulWidget {
  PostModel postModel;
  PoleMain({super.key, required this.postModel});

  @override
  State<PoleMain> createState() => _PoleMainState();
}

class _PoleMainState extends State<PoleMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 470,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderPost(time: "5 days", view: "25k"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.postModel.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                  flex: 5,
                  child: QuestionPanel(
                    postModel: widget.postModel,
                  )),
              Flexible(
                flex: 1,
                child: PostProfile(postModel: widget.postModel),
              )
            ],
          ),
        ),
        SocialPanel(
          postModel: widget.postModel,
        ),
      ],
    );
  }
}
