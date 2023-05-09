// import package
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupCustomTextField extends StatelessWidget {
  SignupCustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.errorText});
  final TextEditingController controller;
  final String labelText;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    return Center(
      child: Container(
        width: bodyWidth * 0.91,
        height: bodyHeight * 0.09,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: ValueListenableBuilder(
          builder: ((_, __, ___) => TextField(
                controller: controller,
                keyboardType: (labelText == 'Email')
                    ? TextInputType.emailAddress
                    : TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 20),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorText: (errorText != null) ? errorText : null,
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  labelStyle: const TextStyle(
                    color: Color(0xFF9B9B9B),
                  ),
                  labelText: labelText,
                  suffixIcon:
                      (errorText == null && controller.value.text.length > 4)
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : null,
                ),
                obscureText: (labelText == 'Password') ? true : false,
                onChanged: (_) => errorText = null,
              )),
          valueListenable: controller,
        ),
      ),
    );
  }
}
