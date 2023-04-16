import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/item_hotels_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final List<HotelModel> listHotel = [
    HotelModel(
        'Mường Thanh', AssetHelper.hotel1, 'VietNam', '200 m', 4.5, 345, 679),
    HotelModel(
        'Thousand Star', AssetHelper.hotel2, 'Dubai', '3 km', 4, 125, 999),
    HotelModel('Marriott International', AssetHelper.hotel3,
        'Maryland State America', '1 km', 4.5, 222, 123),
    HotelModel('Hilton Worldwide', AssetHelper.hotel1, 'Virginia State America',
        '500 m', 3.5, 264, 222),
    HotelModel('Park Hyatt Busan', AssetHelper.hotel2, 'Korea', '400 m', 3.5,
        1233, 555),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        titleString: 'Hotels',
        implementLeading: true,
        implementMenu: true,
        childAppBar: SingleChildScrollView(
          child: Column(
            children: [
              ...listHotel.map((e) => ItemHotelsWidget(hotelModel: e)).toList(),
            ],
          ),
        ));
  }
}
