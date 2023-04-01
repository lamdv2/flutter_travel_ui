import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  ItemUtilityHotelWidget({Key? key}) : super(key: key);

  final List<Map<String, String>> listUtility = [
    {
      'icon': AssetHelper.iconWifi,
      'name': 'Free\nWifi',
    },
    {
      'icon': AssetHelper.iconNoRefund,
      'name': 'Non-\nRefundable',
    },
    {
      'icon': AssetHelper.iconKnife,
      'name': 'Free\nBreakfast',
    },
    {
      'icon': AssetHelper.iconNoSmoking,
      'name': 'Non-\nSmoking',
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
            fontSize: 12,
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
