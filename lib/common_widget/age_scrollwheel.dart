import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class AgeScrollWheel extends StatefulWidget {
  const AgeScrollWheel({Key? key}) : super(key: key);

  @override
  State<AgeScrollWheel> createState() => _AgeScrollWheelState();
}

class _AgeScrollWheelState extends State<AgeScrollWheel> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = FixedExtentScrollController(initialItem: 11);
    _controller.addListener(_handleScrollChange);
  }

  void _handleScrollChange() {
    setState(() {
      // Trigger a rebuild when the selected item changes.
    });
  }

  @override
  void dispose() {
    // Avoid memory leaks.
    _controller.removeListener(_handleScrollChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 100,
                  builder: (context, index) {
                    bool isSelected = index == _controller.selectedItem;
                    Color textColor =
                        isSelected ? TColor.gray : TColor.lightGray;

                    return Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        color: textColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
