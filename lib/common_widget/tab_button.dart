import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectedIcon;
  final VoidCallback onTap;
  final bool isActive;
  const TabButton(
    {
      super.key, 
      required this.icon,
      required this.selectedIcon, 
      required this.isActive, 
      required this.onTap
    }
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Image.asset(
            isActive ? selectedIcon : icon,
            width: 25, 
            height: 25, 
            fit: BoxFit.fitWidth
          ),
          SizedBox(
            height: isActive ? 8 : 12,
          ),
          if (isActive)
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: TColor.primaryG
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}