import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int selectedPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.3, // Set a fixed height for PageView
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              children: List.generate(3, (i) {
                return Center(
                  child: OnBoardingItems(),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: PageViewDotIndicator(
              currentItem: selectedPage,
              count: 3,
              unselectedColor: Colors.black26,
              selectedColor: Colors.blue,
              size: const Size(12, 12),
              unselectedSize: const Size(8, 8),
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              fadeEdges: false,
              boxShape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
              onItemClicked: (index) {},
            ),
          ),
        ],
      ),
    );
  }
  
  OnBoardingItems() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/onBoarding/board1.png'))
          ),
        ),
        Text("Choose Product"),
        Text("Find your best product from popular shop without any delay"),
      ],
    );
  }
}
