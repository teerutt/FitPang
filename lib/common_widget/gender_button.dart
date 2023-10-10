import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class GenderButton extends StatelessWidget {
  final String icon;
  final String selectedIcon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final double fontSize;
  final FontWeight fontWeight;
  const GenderButton(
    {
      super.key, 
      required this.icon,
      required this.selectedIcon, 
      required this.label,
      required this.isActive, 
      required this.onTap,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w700
    }
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          gradient: isActive 
            ? LinearGradient(colors: TColor.primaryG)
            : null,
          color: isActive ? null : TColor.lightenGray,
          borderRadius: BorderRadius.circular(75),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Image.asset(
              isActive ? selectedIcon : icon,
              width: 50,
              height: 50,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: isActive ? TColor.white : TColor.gray,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ]
        ),
      ),
    );
  }
}