import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';

class SettingEditRow extends StatelessWidget {
  final String label;
  final String title;
  final VoidCallback onPressed;
  const SettingEditRow({super.key, required this.label, required this.title, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // Expanded(
              Text(
                label,
                style: TextStyle(
                  color: TColor.primaryColor1,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            // ),
          ],
        ),
      ),
    );
  }
}