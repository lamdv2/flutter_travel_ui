import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_guestandroom_widget.dart';

import '../../core/helpers/asset_helper.dart';

class AddGuestAndRoomScreen extends StatefulWidget {
  const AddGuestAndRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/add_guest_and_room_screen';

  @override
  State<AddGuestAndRoomScreen> createState() => _AddGuestAndRoomScreenState();
}

class _AddGuestAndRoomScreenState extends State<AddGuestAndRoomScreen> {
  final GlobalKey<ItemGuestAndRoomWidgetState> _itemCountGuest = GlobalKey<ItemGuestAndRoomWidgetState>();
  final GlobalKey<ItemGuestAndRoomWidgetState> _itemCountRoom = GlobalKey<ItemGuestAndRoomWidgetState>();

  @override
  Widget build(BuildContext context) {

    return AppBarContainerWidget(
      titleString: 'Add Guest and Room',
      implementLeading: true,
      childAppBar: Column(
        children: [
          const SizedBox(height: kMediumPadding * 3,),
          ItemGuestAndRoomWidget(
            key: _itemCountGuest,
            icon: AssetHelper.iconGuest,
            title: 'Guest',
            initData: 1,
          ),
          const SizedBox(height: kMediumPadding,),
          ItemGuestAndRoomWidget(
            key: _itemCountRoom,
            icon: AssetHelper.iconRoom,
            title: 'Room',
            initData: 1,
          ),
          const SizedBox(height: kMediumPadding,),
          ButtonWidget(
            textBtn: 'Done',
            onTap: (){
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number,
              ]);
            },
          ),
        ],
      ),
    );
  }
}
