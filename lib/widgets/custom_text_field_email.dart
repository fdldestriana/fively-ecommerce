// import package
import 'package:fively_ecommerce/utils/size.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFieldEmail extends StatefulWidget {
  const CustomTextFieldEmail({super.key, required this.labelText});
  final String labelText;

  @override
  State<CustomTextFieldEmail> createState() => _CustomTextFieldEmailState();
}

class _CustomTextFieldEmailState extends State<CustomTextFieldEmail> {
  final TextEditingController controller = TextEditingController();

  String? get _errorText {
    final text = controller.value.text;

    if (text.isNotEmpty && !text.contains('@')) {
      return 'Not a  valid email address. Should be your@email.com';
    }
    return null;
  }

  bool isDone = false;
  bool isValid = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBar myAppbar = AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFF9F9F9),
      leading: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.transparent),
            backgroundColor: const Color(0xFFF9F9F9)),
        onPressed: () {
          Navigator.of(context).canPop();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final body = sizeConfig.bodyheight - myAppbar.preferredSize.height;

    return Center(
      child: Container(
        width: bodyWidth * 0.91,
        height: body * 0.09,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 20),
            errorText: _errorText,
            labelStyle: isDone && !isValid
                ? const TextStyle(color: Colors.red)
                : const TextStyle(color: Color(0xFF9B9B9B)),
            labelText: widget.labelText,
            suffixIcon: (isDone && !isValid)
                ? const Icon(
                    Icons.close,
                    color: Colors.red,
                  )
                : (isDone && isValid)
                    ? const Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    : null,
          ),
          onChanged: (value) {
            setState(() {
              (value.isNotEmpty) ? isDone = true : isDone = false;
              (EmailValidator.validate(value))
                  ? isValid = true
                  : isValid = false;
            });
          },
          onEditingComplete: () {
            // to make keyboard dismiss automatically after pressing the submit button
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
        ),
      ),
    );
  }
}
