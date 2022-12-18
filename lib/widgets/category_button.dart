import 'package:fively_ecommerce/models/category.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((BuildContext _, BoxConstraints constraints) => OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFF222222),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * 0.08)),
                fixedSize: Size(
                    constraints.maxWidth * 0.27, constraints.maxHeight * 0.16)),
            onPressed: () {},
            child: Text(
              category.name,
              style: const TextStyle(color: Color(0xFFFFFFFF)),
            ),
          )),
    );
  }
}
