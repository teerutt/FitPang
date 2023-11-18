import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';

class SettingSettingRow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SettingSettingRow({super.key, required this.title, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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