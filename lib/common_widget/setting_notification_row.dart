import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class SettingNotificationRow extends StatefulWidget {
  final String title;
  const SettingNotificationRow({Key? key, required this.title});

  @override
  State<SettingNotificationRow> createState() => _SettingNotificationRowState();
}

class _SettingNotificationRowState extends State<SettingNotificationRow> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                widget.title,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 15,
                ),
              ),
            ),
            CustomAnimatedToggleSwitch<bool>(
              current: positive,
              values: const [false, true],
              // dif: 0.0,
              indicatorSize: const Size.square(30.0),
              animationDuration:
                  const Duration(milliseconds: 200),
              animationCurve: Curves.linear,
              onChanged: (b) => setState(() => positive = b),
              iconBuilder: (context, local, global) {
                return const SizedBox();
              },
              cursors: const ToggleCursors(
                  defaultCursor: SystemMouseCursors.click),
              onTap: (_) => setState(() => positive = !positive),
              iconsTappable: false,
              wrapperBuilder: (context, global, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        left: 10.0,
                        right: 10.0,
                        height: 30.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: positive
                                ? LinearGradient(
                                    colors: TColor.primaryG)
                                : null,
                            color: TColor.midGray,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(50.0)),
                          ),
                        )),
                    child,
                  ],
                );
              },
              foregroundIndicatorBuilder: (context, global) {
                return SizedBox.fromSize(
                  size: const Size(10, 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(50.0)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0.05,
                            blurRadius: 1.1,
                            offset: Offset(0.0, 0.8))
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}