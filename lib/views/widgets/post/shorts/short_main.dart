import 'package:bluecs/models/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShortMain extends StatelessWidget {
  final PostModel postModel;

  const ShortMain({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    final shorts = postModel.shorts ?? [];

    return Container(
      height: 270,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Shorts",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.separated(
              itemCount: shorts.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final short = shorts[index];

                return Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.blueGrey,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(short.thumbnailUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Action button
                      Positioned(
                        top: 4,
                        right: 4,
                        child: IconButton(
                          icon: const Icon(Icons.more_vert_outlined,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                      // Title
                      Positioned(
                        left: 10,
                        bottom: 10,
                        right: 10,
                        child: Text(
                          short.title,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: const Offset(1.5, 1.5),
                                blurRadius: 4.0,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
