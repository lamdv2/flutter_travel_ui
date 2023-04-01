import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/screens/checkout_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/item_room_booking_widget.dart';
import 'package:travel_app/representation/widgets/item_utility_hotel_widget.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/select_room_screen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Deluxe Room',
      size: 27,
      utility: 'Free Cancellation',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Executive Suite',
      size: 32,
      utility: 'Non-refundable',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'King Bed Only Room',
      size: 24,
      utility: 'Non-refundable',
      price: 214,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select Room',
      implementLeading: true,
      childAppBar: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMinPadding,
            ),
            ...listRoom
                .map((e) => ItemRoomBookingWidget(
                      roomModel: e,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(CheckOutScreen.routeName, arguments: e);
                      },
                    ))
                .toList(),
            const SizedBox(
              height: kTopPadding,
            ),
          ],
        ),
      ),
    );
  }
}
