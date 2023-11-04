import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';

enum RoundButtonCreateType { bgGradient, bgSGradient, textGradient }

class RoundButtonCreate extends StatelessWidget {
  final String title;
  final RoundButtonCreateType type;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const RoundButtonCreate(
      {super.key,
      required this.title,
      this.type = RoundButtonCreateType.bgGradient,
      this.fontSize = 16,
      this.elevation = 1,
      this.fontWeight = FontWeight.w700,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // Vertically center the content
      children: [
        // SizedBox(height: 20), // Add empty space above the button
        Center(
            child: SizedBox(
                width: 250,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: type == RoundButtonCreateType.bgSGradient
                            ? TColor.secondaryG
                            : TColor.primaryG,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: type == RoundButtonCreateType.bgGradient ||
                              type == RoundButtonCreateType.bgSGradient
                          ? const [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 0.5,
                                  offset: Offset(0, 0.5))
                            ]
                          : null),
                  child: MaterialButton(
                    onPressed: onPressed,
                    height: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    textColor: TColor.primaryColor1,
                    minWidth: double.maxFinite,
                    elevation: type == RoundButtonCreateType.bgGradient ||
                            type == RoundButtonCreateType.bgSGradient
                        ? 0
                        : elevation,
                    color: type == RoundButtonCreateType.bgGradient ||
                            type == RoundButtonCreateType.bgSGradient
                        ? Colors.transparent
                        : TColor.white,
                    child: type == RoundButtonCreateType.bgGradient ||
                            type == RoundButtonCreateType.bgSGradient
                        ? Text(title,
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold))
                        : ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                      colors: TColor.primaryG,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)
                                  .createShader(Rect.fromLTRB(
                                      0, 0, bounds.width, bounds.height));
                            },
                            child: Text(title,
                                style: TextStyle(
                                    color: TColor.primaryColor1,
                                    fontSize: fontSize,
                                    fontWeight: fontWeight)),
                          ),
                  ),
                )))
      ],
    );
  }
}
