import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/extensions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/add_guest_and_room_screen.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  //final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  static String? dateSelected;
  static String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments;

    return AppBarContainerWidget(
      titleString: 'Hotel Booking',
      implementLeading: true,
      childAppBar: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2.5,
            ),
            IconBookingWidget(
                icon: AssetHelper.iconLocation,
                title: 'Destination',
                description: name != null ? name.toString() : 'Viet Nam'),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            StatefulBuilder(builder: (context, setState) {
              return IconBookingWidget(
                icon: AssetHelper.iconCalendar,
                title: 'Select Date',
                description: dateSelected ?? 'Monday, March 20, 2023',
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDateScreen.routeName);
                  if (result is List<DateTime?>) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(() {});
                  }
                },
              );
            }),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            IconBookingWidget(
              icon: AssetHelper.iconBed,
              title: 'Guest and room',
              description: guestAndRoom ?? '2 Guest, 1 Room',
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(AddGuestAndRoomScreen.routeName);
                if (result is List<int>) {
                  guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: kBottomBarIconSize,
            ),
            ButtonWidget(
              textBtn: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(HotelScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
