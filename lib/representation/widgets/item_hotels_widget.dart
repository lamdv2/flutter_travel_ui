import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/screens/detail_hotel_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/dashline_widget.dart';
import 'package:travel_app/representation/widgets/google_map_widget.dart';

class ItemHotelsWidget extends StatelessWidget {
  const ItemHotelsWidget({Key? key, required this.hotelModel})
      : super(key: key);

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            // width: double.infinity,
            // margin: const EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                bottomRight: Radius.circular(kDefaultPadding),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.iconLocation),
                    const SizedBox(
                      width: kItemPadding,
                    ),
                    Text(hotelModel.location),
                    Expanded(
                      child: Text(
                        ' - ${hotelModel.awayKilometer} from destination',
                        style: const TextStyle(
                          color: ColorPalette.subTitleColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 6)),
                    ImageHelper.loadFromAsset(AssetHelper.iconStar),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' (${hotelModel.numberOfReview} reviews)',
                      style: const TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$ ${hotelModel.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: kMinPadding,
                          ),
                          const Text('/night'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        textBtn: 'Book a room',
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              DetailHotelScreen.routeName,
                              arguments: hotelModel);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
