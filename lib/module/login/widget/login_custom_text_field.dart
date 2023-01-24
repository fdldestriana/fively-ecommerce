// import package
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';

class LoginCustomTextField extends StatefulWidget {
  const LoginCustomTextField({super.key, required this.labelText});
  final String labelText;

  @override
  State<LoginCustomTextField> createState() => _LoginCustomTextFieldState();
}

class _LoginCustomTextFieldState extends State<LoginCustomTextField> {
  final TextEditingController _controller = TextEditingController();

  bool _submitted = false;

  String? get _errorText {
    if (_controller.value.text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (_controller.value.text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final body = sizeConfig.screenHeight;

    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, value, child) => Center(
        child: Container(
          width: bodyWidth * 0.91,
          height: body * 0.09,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 20),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              errorText: _submitted ? _errorText : null,
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              labelStyle: const TextStyle(color: Color(0xFF9B9B9B)),
              labelText: widget.labelText,
              suffixIcon: (_errorText == null)
                  ? const Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : null,
            ),
            obscureText: (widget.labelText == 'Password') ? true : false,
            onChanged: ((value) => _submitted = !_submitted),
            onEditingComplete: () {
              // to make keyboard dismiss automatically after pressing the submit button
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onSubmitted: ((value) {
              _submitted = !_submitted;
              _errorText;
            }),
          ),
        ),
      ),
    );
  }
}
