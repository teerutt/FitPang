import 'package:flutter/material.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider>
    with TickerProviderStateMixin {
  List<String> assets = ['', '', '', '', ''];
  final color = [
    Colors.red,
    Colors.amber,
    Colors.teal,
    Colors.blueGrey,
    Colors.blue,
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text("Carousel Slider",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
              width: 150,
              // width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: assets.length,
                physics: BouncingScrollPhysics(),
                controller:
                    PageController(initialPage: 0, viewportFraction: 0.7),
                onPageChanged: (value) {
                  currentindex = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        //  color: color[index],
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      assets[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            TabPageSelector(
              controller: TabController(
                  length: assets.length,
                  initialIndex: currentindex,
                  vsync: this),
              selectedColor: Colors.red,
              color: Colors.grey,
              borderStyle: BorderStyle.none,
            ),
          ]),
        )));
  }
}
