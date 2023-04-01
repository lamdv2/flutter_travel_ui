import 'package:flutter/material.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class ItemGuestAndRoomWidget extends StatefulWidget {
  const ItemGuestAndRoomWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.initData = 0}
    ) : super(key: key);

  final String icon;
  final String title;
  final int initData;

  @override
  State<ItemGuestAndRoomWidget> createState() => ItemGuestAndRoomWidgetState();
}

class ItemGuestAndRoomWidgetState extends State<ItemGuestAndRoomWidget> {

  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initData.toString())..addListener(() {
      number = _textEditingController.text as int;
    });
    number = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState){
        return Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(kTopPadding)),

          ),
          child: Row(
            children: [
              Image.asset(
                widget.icon,
                width: 36,
                height: 36,
              ),
              const SizedBox(width: kDefaultPadding,),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: kDefaultPadding,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  if(number > 1){
                    setState(() {
                      number--;
                      _textEditingController.text = number.toString();
                      if(_focusNode.hasFocus){
                        _focusNode.unfocus();
                      }
                    });
                  }
                },
                child: ImageHelper.loadFromAsset(
                  AssetHelper.iconDecrease,
                ),
              ),
              const SizedBox(width: kMinPadding,),
              Container(
                height: 35,
                width: 60,
                padding: const EdgeInsets.only(left: 3),
                alignment: Alignment.center,
                child: TextField(
                  controller: _textEditingController,
                  textAlign: TextAlign.center,
                  focusNode: _focusNode,
                  enabled: true,
                  autocorrect: false,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 18),
                  ),
                  onChanged: (value) {

                  },
                  onSubmitted: (String submitValue) {

                  },
                ),
              ),
              const SizedBox(width: kMinPadding,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    number++;
                  });
                  _textEditingController.text = number.toString();
                  if(_focusNode.hasFocus){
                    _focusNode.unfocus();
                  }
                },
                child: ImageHelper.loadFromAsset(
                  AssetHelper.iconIncrease,
                ),
              ),
            ],
          ),
        );
      });
  }
}
