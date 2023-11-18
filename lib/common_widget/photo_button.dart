import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class PhotoButton extends StatelessWidget {
  final VoidCallback onTap;
  const PhotoButton(
    {
      super.key, 
      required this.onTap,
    }
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: TColor.gray,
          borderRadius: BorderRadius.circular(75),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/camera.png",
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ]
        ),
      ),
    );
  }
}