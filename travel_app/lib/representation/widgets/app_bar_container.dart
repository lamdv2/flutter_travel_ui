import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/main_app.dart';

class AppBarContainerWidget extends StatelessWidget {
  final Widget childAppBar;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementMenu;

  const AppBarContainerWidget({Key? key,
    required this.childAppBar,
    this.title,
    this.implementLeading = false,
    this.titleString,
    this.implementMenu = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void showPopupMenu(Offset globalPosition) async {
      await showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(500, 100, 20, 100),
        shadowColor: Colors.black,
        items: [
          PopupMenuItem<String>(
              value: 'Setting',
              child: const Text('Setting'),
              onTap: (){
                Navigator.of(context).pushNamed(MainApp.routeName);
              },
          ),
          PopupMenuItem<String>(
              value: 'Log out',
              child: const Text('Log out'),
              onTap: () {
                Navigator.of(context).pushNamed('');
              },
          ),
          PopupMenuItem<String>(
            value: 'Exit',
            child: const Text('Exit'),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
        elevation: 8.0,
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: AppBar(
              title: title?? Row(
                children: [
                  if(implementLeading)
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(kIconRadius),),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(kItemPadding),
                      margin: const EdgeInsets.only(left: 8),
                      child: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: kBottomBarIconSize,
                      ),
                    ),
                  ),
                  Expanded(child: Center(
                    child: Column(
                      children: [
                        Text(titleString ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  )),
                  if(implementMenu)
                  GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      showPopupMenu(details.globalPosition);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(kIconRadius),),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(kItemPadding),
                      margin: const EdgeInsets.only(right: 8),
                      child: const Icon(
                        FontAwesomeIcons.bars,
                        color: Colors.black,
                        size: kBottomBarIconSize,
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              elevation: 0,
              toolbarHeight: 110,
              automaticallyImplyLeading: false,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36))
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.oval1),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.oval2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 160),
            padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
            ),
            child: childAppBar,
          )
        ],
      ),
    );
  }
}
