// import package
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  const CardAddress({
    Key? key,
    required this.bodyWidth,
    required this.bodyHeight,
  }) : super(key: key);

  final double bodyWidth;
  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: bodyWidth * 0.04, right: bodyWidth * 0.04),
      height: bodyHeight * 0.19,
      width: bodyWidth * 0.91,
      child: LayoutBuilder(
        builder: (BuildContext _, BoxConstraints constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Shipping address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.14,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(bodyWidth * 0.02)),
                color: const Color(0xFFFFFFFF),
              ),
              height: constraints.maxHeight * 0.74,
              width: constraints.maxWidth * 1.00,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: constraints.maxWidth * 0.03,
                          top: constraints.maxHeight * 0.12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Jane Doe'),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          const Text(
                              '3 Newbridge Court\nChino Hills, CA 91709, United States')
                        ],
                      )),
                  SizedBox(
                    height: constraints.maxWidth * 0.51,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change',
                        style: TextStyle(color: Color(0xFFDB3022)),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
