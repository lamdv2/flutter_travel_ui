import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/dashline_widget.dart';
import 'package:travel_app/representation/widgets/google_map_widget.dart';
import 'package:travel_app/representation/widgets/item_utility_detail_hotel_widget.dart';

import '../../core/constants/color_constants.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({Key? key, required this.hotelModel})
      : super(key: key);

  static const String routeName = '/detail_hotel_screen';
  final HotelModel hotelModel;

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  bool heartIcon = true;
  IconData? iconHeart = FontAwesomeIcons.solidHeart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.hotel4,
              boxFit: BoxFit.fill),
        ),
        Positioned(
          top: kMediumPadding * 3,
          left: kMediumPadding,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(kItemPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(kIconRadius)),
              ),
              child:
                  const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
            ),
          ),
        ),
        Positioned(
          top: kMediumPadding * 3,
          right: kMediumPadding,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (heartIcon) {
                  heartIcon = false;
                } else {
                  heartIcon = true;
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.all(kItemPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(kDefaultPadding)),
              ),
              child: Icon(
                heartIcon
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                color: heartIcon ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultPadding)),
                        ),
                      ),
                    ),
                    // const SizedBox(height: kMediumPadding,),
                    // const Positioned(child: GoogleMapWidget()),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.hotelModel.hotelName,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '\$${widget.hotelModel.price}',
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '/night',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.iconPlace),
                              const SizedBox(
                                width: kItemPadding,
                              ),
                              Text(
                                widget.hotelModel.location,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const DashLineWidget(),
                          const SizedBox(
                            height: kItemPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.iconStar),
                              const SizedBox(
                                width: kTopPadding,
                              ),
                              Text(
                                '${widget.hotelModel.star}/5 ',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '(${widget.hotelModel.numberOfReview} review)',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey.shade500,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette.primaryColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kItemPadding,
                          ),
                          const DashLineWidget(),
                          const SizedBox(
                            height: kBottomBarIconSize,
                          ),
                          const Text(
                            'Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const Text(
                            'You will find every comfort because many of the '
                            'services that the hotel offers for travellers and of'
                            'course the hotel is very comfortable.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          ItemUtilityDetailHotelWidget(),
                          const SizedBox(
                            height: kMediumPadding,
                          ),
                          const Text(
                            'Location',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const Text(
                            'Located in the famous neighborhood of Seoul, '
                            'Grand Luxury’s is set in a building built in the'
                            '2010s.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Positioned(
                            child: GestureDetector(
                              onDoubleTap: () {
                                Navigator.of(context)
                                    .pushNamed(GoogleMapWidget.routeName);
                              },
                              child: const GoogleMapWidget(),
                            ),
                          ),
                          const SizedBox(
                            height: kMediumPadding,
                          ),
                          ButtonWidget(
                            textBtn: 'Select Room',
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(SelectRoomScreen.routeName);
                            },
                          ),
                          const SizedBox(
                            height: kMediumPadding,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    ));
  }
}
