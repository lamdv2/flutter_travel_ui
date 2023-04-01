import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';

class IconBookingWidget extends StatelessWidget {
  const IconBookingWidget({Key? key, required this.icon, required this.title, required this.description, this.onTap}) : super(key: key);

  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kTopPadding)),

        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 36,
              height: 36,
            ),
            const SizedBox(width: kDefaultPadding,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(
                  height: kTopPadding,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: kDefaultPadding,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
