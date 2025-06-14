import 'package:bluecs/models/post.dart';
import 'package:bluecs/views/widgets/post/user_avatar.dart';
import 'package:bluecs/views/widgets/post/utils/format.dart';
import 'package:flutter/material.dart';

class SocialPanel extends StatelessWidget {
  PostModel postModel;
  SocialPanel({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.translate(
      offset: Offset(0, -20),
      child: LayoutBuilder(builder: (context, constraints) {
        double minWidthNeeded = 40 + 40 + 24 + 15;
        bool shareRatio = constraints.maxWidth > minWidthNeeded;

        return Container(
          width: size.width - 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 3,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double minWidthNeeded = 40 + 40 + 24 + 15;
                    bool showProfile = constraints.maxWidth > minWidthNeeded;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (showProfile)
                          UsersAvatar(
                            isNative: false,
                            images: [
                              'https://randomuser.me/api/portraits/women/1.jpg',
                              'https://randomuser.me/api/portraits/women/2.jpg',
                              'https://randomuser.me/api/portraits/women/3.jpg',
                            ],
                          ),
                        if (showProfile) SizedBox(width: 4),
                        Text(postModel.comments.toString()),
                        SizedBox(width: 10),
                        Icon(Icons.message_outlined)
                      ],
                    );
                  },
                ),
              ),
              Container(
                width: 1.2,
                height: 20,
                color: Colors.white.withOpacity(0.5),
              ),
              Flexible(
                  flex: 3,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double minWidthNeeded = 40 + 40 + 24 + 15;
                      bool showProfile = constraints.maxWidth > minWidthNeeded;

                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (showProfile)
                              UsersAvatar(
                                isNative: true,
                                images: [
                                  'assets/icons/like.png',
                                  'assets/icons/heart.png',
                                  'assets/icons/icons.png',
                                ],
                              ),
                            if (showProfile) SizedBox(width: 4),
                            Text(formatNumber(postModel.likes)),
                            SizedBox(width: 4),
                            Icon(Icons.thumb_up_alt_outlined),
                          ]);
                    },
                  )),
              Container(
                width: 1.5,
                height: 20,
                color: Colors.white.withOpacity(0.5),
              ),
              Flexible(
                  flex: shareRatio ? 3 : 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(postModel.shares.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.share),
                    ],
                  )),
            ],
          ),
        );
      }),
    );
  }
}
