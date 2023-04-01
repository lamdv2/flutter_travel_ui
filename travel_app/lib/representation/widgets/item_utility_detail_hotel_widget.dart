import 'package:flutter/material.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class ItemUtilityDetailHotelWidget extends StatelessWidget {
  ItemUtilityDetailHotelWidget({Key? key}) : super(key: key);

  final List<Map<String, String>> listUtility = [
    {
      'icon': AssetHelper.iconRestaurant,
      'name': 'Restaurant',
    },
    {
      'icon': AssetHelper.iconWifi2,
      'name': 'Wifi',
    },
    {
      'icon': AssetHelper.iconNoKnow,
      'name': 'Currency\nExchange',
    },
    {
      'icon': AssetHelper.iconBad,
      'name': '24-hour\nFront Desk',
    },
    {
      'icon': AssetHelper.iconMenu,
      'name': 'More',
    },
  ];

  Widget _buildItemUtilityHotel(String icon, String name) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        const SizedBox(
          height: kTopPadding,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtility.map((e) => _buildItemUtilityHotel(e['icon']!, e['name']!)).toList(),
      ),
    );
  }
}
