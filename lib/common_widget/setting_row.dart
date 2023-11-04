import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';

class SettingRow extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  const SettingRow({super.key, required this.icon, required this.title, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 30, 
              width: 30, 
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 15,
                ),
              ),
            ),
            Image.asset(
              "assets/img/arrowright.png",
              height: 15, 
              width: 15, 
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}