import 'package:flutter/material.dart';

class UsersAvatar extends StatelessWidget {
  bool isNative;
  List<String> images;
  UsersAvatar({super.key, required this.isNative, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 40,
      child: Stack(
        children: List.generate(images.length, (index) {
          return Positioned(
            left: index * 10.0, // Adjust overlap by changing this value
            child: CircleAvatar(
              radius: 10,
              backgroundImage: isNative
                  ? AssetImage(images[index])
                  : NetworkImage(images[index]),
            ),
          );
        }),
      ),
    );
  }
}
