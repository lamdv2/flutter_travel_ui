import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/dashline_widget.dart';
import 'package:travel_app/representation/widgets/item_utility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({
    Key? key,
    required this.roomModel,
    this.onTap,
    this.numRoom,
  }) : super(key: key);

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMediumPadding),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kItemPadding),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.roomName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Text(
                    'RoomSize: ${roomModel.size} m2',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  const Text(
                    'Free Cancellation',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ImageHelper.loadFromAsset(
                roomModel.roomImage,
                radius: const BorderRadius.all(Radius.circular(kItemPadding)),
              ),
            ],
          ),
          ItemUtilityHotelWidget(),
          const DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: kTopPadding,
                    ),
                    const Text(
                      '/night',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: numRoom == null
                    ? ButtonWidget(
                        onTap: onTap,
                        textBtn: 'Choose',
                      )
                    : Text(
                        '$numRoom room',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }
}
