import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  final String text;
  final bool isActive;
  Function() onTap;
  TabsWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive
            ? Colors.blue.withAlpha((0.1 * 255).toInt())
            : Colors.transparent,
        side: BorderSide(
          color: isActive ? Colors.blue : Colors.white,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
