import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) => Container(
        width: constraints.maxWidth * 0.10,
        height: constraints.maxHeight * 0.35,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFDB3022),
        ),
        child: IconButton(
          iconSize: 48,
          icon: Image.asset('assets/images/buttons/add_to_bag.png'),
          onPressed: () {},
        ),
      ),
    );
  }
}
