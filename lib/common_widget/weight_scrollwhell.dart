import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class WeightScrollWhell extends StatefulWidget {
  final Function(int) onWeightSelected;
  const WeightScrollWhell({Key? key, required this.onWeightSelected}) : super(key: key);

  @override
  State<WeightScrollWhell> createState() => _WeightScrollWhellState();
}

class _WeightScrollWhellState extends State<WeightScrollWhell> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();

    // Set the initialItem to 100
    _controller = FixedExtentScrollController(initialItem: 50);
    _controller.addListener(_handleScrollChange);
  }

  void _handleScrollChange() {// Trigger a rebuild when the selected item changes.
    setState(() {
      int selectedWeight = _controller.selectedItem+1;
      widget.onWeightSelected(selectedWeight);
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
            width: 70,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 199, // Adjust the count as needed
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
