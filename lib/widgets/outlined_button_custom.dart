import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class OutlinedButtonCustom extends StatefulWidget {
  const OutlinedButtonCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<OutlinedButtonCustom> createState() => _OutlinedButtonCustomState();
}

class _OutlinedButtonCustomState extends State<OutlinedButtonCustom> {
  String? size;
  String? color;
  String? choosen;

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bodyWidth * 0.02)),
            fixedSize: Size(bodyWidth * 0.37, bodyHeight * 0.06)),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => ModalBottomSheet(
                    title: widget.title,
                  )).then((value) {
            setState(() {
              choosen = value;
            });
          });
        },
        child: (choosen == null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                  ),
                  const Icon(
                    Icons.arrow_drop_down_sharp,
                  )
                ],
              )
            : Text(choosen!.toUpperCase()));
  }
}
