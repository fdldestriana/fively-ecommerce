// import package
import 'package:fively_ecommerce/utils/size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.labelText});
  final String labelText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();
  bool isDone = false;

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
          obscureText: (widget.labelText == 'Password') ? true : false,
          controller: controller,
          keyboardType: (widget.labelText == 'Email')
              ? TextInputType.emailAddress
              : TextInputType.name,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 20),
            labelStyle: const TextStyle(color: Color(0xFF9B9B9B)),
            labelText: widget.labelText,
            suffixIcon: (isDone && widget.labelText != 'Email')
                ? const Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : null,
          ),
          onChanged: (value) {
            setState(() {
              (value.isNotEmpty) ? isDone = true : isDone = false;
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
