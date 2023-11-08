import 'package:fitpang/view/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/common/color_extension.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(color: TColor.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Fitpan",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "G",
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: TColor.primaryG,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 100.0, 48.0),
                          ),
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Everybody Can do it",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: RoundButton(
                    title: "Get Started",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingView()));
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
