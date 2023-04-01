import 'dart:async';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController = StreamController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description, AlignmentGeometry alignmentGeometry){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          alignment: alignmentGeometry,
          child: ImageHelper.loadFromAsset(image, height: 425, boxFit: BoxFit.fitHeight)
        ),
        const SizedBox(height: kMediumPadding * 2,),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kMediumPadding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(height: kMediumPadding,),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(AssetHelper.intro1, 'Book a flight', 'Found a flight that matches your destinationand schedule? Book it instantly.', Alignment.topRight),
              _buildItemIntroScreen(AssetHelper.intro2, 'Find a hotel room', 'Select the day, book your room. We give youthe best price.', Alignment.topCenter),
              _buildItemIntroScreen(AssetHelper.intro3, 'Enjoy your trip', 'Easy discovering new places and share these between your friends and travel together.', Alignment.topLeft),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect:  const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange
                    ),
                  ),
                ),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                        child: ButtonWidget(
                          textBtn: snapshot.data !=2 ? 'next': 'Get started',
                          onTap: (){
                            if(_pageController.page != 2){
                              _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                            } else{
                              Navigator.of(context).pushNamed(MainApp.routeName);
                            }
                          },
                        )
                    );
                  }
                )
              ],
          ))
        ],
      ),
    );
  }
}
