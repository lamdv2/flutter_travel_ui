import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

// ignore: must_be_immutable
class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({Key? key}) : super(key: key);

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  static const String routeName = '/select_date_screen';

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Select Date",
      implementLeading: true,
      childAppBar: Column(
        children: [
          const SizedBox(height: kMediumPadding * 2,),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
              else{
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          ButtonWidget(
            textBtn: 'Select',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            textBtn: 'Cancel',
            color: Colors.white70,
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
            gradient: Gradients.defaultGradientButtonCancel,
          ),
        ],
      ),
    );
  }
}
