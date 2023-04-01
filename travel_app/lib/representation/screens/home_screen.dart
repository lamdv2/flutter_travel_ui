import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';

import '../../core/constants/textstyle_constants.dart';
import '../widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Korea',
      'image': AssetHelper.pdKorea,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.pdDubai,
    },
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Turkey',
      'image': AssetHelper.pdTurkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.pdJapan,
    },
  ];

  Widget _buildImageHomScreen(String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(HotelBookingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.infinity,
              boxFit: BoxFit.fitWidth,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.whiteTextColor.bold,
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.5')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builtItemCategory(Widget icon, Color color, Function() onTap, String title){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kBottomBarIconSize),
            ),
            child: icon,
          ),
          const SizedBox(height: kItemPadding,),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hi UserName',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text('Where are you going next?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(FontAwesomeIcons.bell,
              size: kBottomBarIconSize,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 12), Shadow(color: Colors.black)],
            ),
            const SizedBox(width: kDefaultPadding,),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kItemPadding),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8,
                    offset: Offset(1, 2), // Shadow position
                  ),
                ],
              ),
              padding: const EdgeInsets.all(kMinPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.avatar),
            )
          ],
        ),
      ),
      implementLeading: true,
      implementMenu: true,
      childAppBar: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultPadding,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(kItemPadding))
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: kItemPadding
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding,),
          Center(
            child: Row(
              children: [
                Expanded(
                  child: _builtItemCategory(
                      ImageHelper.loadFromAsset(
                        AssetHelper.iconHotel,
                        width: kBottomBarIconSize,
                        height: kBottomBarIconSize,
                      ),
                      const Color(0xfffe9c5e),
                          () => {
                            Navigator.of(context).pushNamed(HotelBookingScreen.routeName)
                          },
                      'Hotels'),
                ),
                const SizedBox(width: kDefaultPadding,),
                Expanded(
                  child: _builtItemCategory(
                      ImageHelper.loadFromAsset(
                        AssetHelper.iconPlane,
                        width: kBottomBarIconSize,
                        height: kBottomBarIconSize,
                      ),
                      const Color(0xffF77777),
                          () => {},
                      'Flights'),
                ),
                const SizedBox(width: kDefaultPadding,),
                Expanded(
                  child: _builtItemCategory(
                      ImageHelper.loadFromAsset(
                        AssetHelper.iconAll,
                        width: kBottomBarIconSize,
                        height: kBottomBarIconSize,
                      ),
                      const Color(0xff3ec8bc),
                          () => {},
                      'All'),
                ),
                const SizedBox(width: kDefaultPadding,),
              ],
            ),
          ),
          const SizedBox(height: kMediumPadding,),
          Row(
            children: const [
              Text('Popular Destinations',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Text('See All',
                style: TextStyle(
                  color: Color(0xff6155cc),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: kMediumPadding,),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: listImageLeft.map(
                        (e) => _buildImageHomScreen(
                          e['name']!,
                          e['image']!,
                        ),
                      ).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: Column(
                      children: listImageRight.map(
                        (e) => _buildImageHomScreen(
                          e['name']!,
                          e['image']!,
                        ),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
