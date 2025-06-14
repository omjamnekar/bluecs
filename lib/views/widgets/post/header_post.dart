import 'package:flutter/material.dart';

class HeaderPost extends StatelessWidget {
  String time;
  String view;
  HeaderPost({super.key, required this.time, required this.view});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        Row(
          children: [
            Icon(
              Icons.remove_red_eye_outlined,
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              size: 20,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              view,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
