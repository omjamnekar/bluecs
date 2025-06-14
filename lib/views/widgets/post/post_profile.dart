import 'package:bluecs/models/post.dart';
import 'package:flutter/material.dart';

class PostProfile extends StatelessWidget {
  PostModel postModel;
  PostProfile({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            postModel.user!.image ??
                "https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postModel.user!.name ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Container(
                width: double.maxFinite,
                child: Text(
                  postModel.user!.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.block,
          color: const Color.fromARGB(255, 147, 11, 1),
          weight: 0.4,
        ),
      ]),
    );
  }
}
