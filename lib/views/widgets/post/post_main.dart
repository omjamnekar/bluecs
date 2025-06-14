import 'package:bluecs/models/post.dart';
import 'package:bluecs/views/widgets/post/header_post.dart';
import 'package:bluecs/views/widgets/post/image_slider.dart';
import 'package:bluecs/views/widgets/post/post_profile.dart';
import 'package:bluecs/views/widgets/post/social_panel.dart';
import 'package:bluecs/views/widgets/post/utils/format.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  PostModel postModel;
  PostWidget({super.key, required this.postModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 470,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: ImageSlider(imageUrls: postModel.imageUrl),
              ),
              Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderPost(
                            time: timeAgo(postModel.postedAgo),
                            view: formatNumber(postModel.views)),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          postModel.title,
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          postModel.subtitle,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PostProfile(
                          postModel: postModel,
                        ),
                        Spacer(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        SocialPanel(
          postModel: postModel,
        ),
      ],
    );
  }
}
