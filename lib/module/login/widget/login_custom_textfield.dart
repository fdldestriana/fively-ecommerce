// import package
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginCustomTextField extends StatelessWidget {
  const LoginCustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.errorText});
  final TextEditingController controller;
  final String labelText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, value, __) => Center(
        child: Container(
          width: bodyWidth * 0.91,
          height: bodyHeight * 0.09,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 20),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              errorText: (errorText == null) ? null : errorText,
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              labelStyle: const TextStyle(color: Color(0xFF9B9B9B)),
              labelText: labelText,
              suffixIcon:
                  (errorText == null && controller.value.text.isNotEmpty)
                      ? const Icon(
                          Icons.done,
                          color: Colors.green,
                        )
                      : null,
            ),
            obscureText: (labelText == 'Password') ? true : false,
            onChanged: (_) => controller.value.text = '',
            onEditingComplete: () {
              // to make keyboard dismiss automatically after pressing the submit button
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onSubmitted: (_) => print(controller.value.text),
          ),
        ),
      ),
    );
  }
}
