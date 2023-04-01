import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_room_booking_widget.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/textstyle_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';
import 'main_app.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout_screen';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<String> listStep = [
    'Book and review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemStepCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kMediumPadding),
              color: isCheck ? Colors.white : Colors.white.withOpacity(0.2)),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: kMinPadding,
        ),
        Text(stepName,
            style: TextStyles.defaultStyle.fontCaption.whiteTextColor),
        const SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          const SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          const SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  Widget _buildItemOptionsCheckout(String icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(
                icon,
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            padding: const EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Text(
                  value,
                  style: TextStyles.defaultStyle.primaryTextColor.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final RoomModel roomModel =
        ModalRoute.of(context)!.settings.arguments as RoomModel;

    return AppBarContainerWidget(
        implementLeading: true,
        titleString: 'Checkout',
        childAppBar: Column(
          children: [
            Row(children: [
              ...listStep
                  .map((e) => _buildItemStepCheckout(
                      listStep.indexOf(e) + 1,
                      e,
                      listStep.indexOf(e) == listStep.length - 1,
                      listStep.indexOf(e) == 0))
                  .toList(),
            ]),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                    ItemRoomBookingWidget(
                      roomModel: roomModel,
                      numRoom: 1,
                      onTap: () {

                      },
                    ),
                    _buildItemOptionsCheckout(AssetHelper.iconUser,
                        'Contact Details', 'Add Contact'),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                    _buildItemOptionsCheckout(AssetHelper.iconPersen,
                        'Promo Code', 'Add Promo Code'),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                    ButtonWidget(
                      textBtn: 'Payment',
                      onTap: () {
                        Navigator.of(context).popUntil((route) =>
                            route.settings.name == MainApp.routeName);
                      },
                    ),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
