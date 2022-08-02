import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  CarouselSlider({Key? key}) : super(key: key);

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  late PageController _pageController;

  List<String> images = [
    "https://images.unsplash.com/photo-1607948937289-5ca19c59e70f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWNvbm9taWNzJTIwYm9va3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWNvbm9taWNzJTIwYm9va3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWNvbm9taWNzJTIwYm9va3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWNvbm9taWNzJTIwYm9va3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWNvbm9taWNzJTIwYm9va3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    // ProjectImages.biomedics,
    // ProjectImages.cs1,
    // ProjectImages.medicine,
    // ProjectImages.og,
    // ProjectImages.principlesofecons,
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: height * 0.3,
          child: PageView.builder(
            itemCount: images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(
                () {
                  activePage = page;
                },
              );
            },
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == activePage;
              return slider(images, pagePosition, active);
            },
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: indicators(images.length, activePage),
        // )
      ],
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(
            images[pagePosition],
          ),
          // image: AssetImage(
          //   images[pagePosition],
          // ),
        ),
      ),
    );
  }

  imageAnimation(PageController animation, images, pagePosition, height) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        print(pagePosition);
        return SizedBox(
          width: double.infinity,
          height: height * 0.3,
          child: widget,
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Image.network(
          images[pagePosition],
        ),
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        return Container(
          margin: EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? ProjectColors.primary
                : ProjectColors.primary.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
