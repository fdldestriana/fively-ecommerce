// import package
import 'package:fively_ecommerce/module/forgot_password/view/forgot_password_view.dart';
import 'package:fively_ecommerce/module/login/controller/login_controller.dart';
import 'package:fively_ecommerce/module/login/widget/login_custom_textfield.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _usernameErrorText;
  String? _passwordErrorText;

  void _usernameValidate() {
    if (_usernameController.value.text.isEmpty) {
      _usernameErrorText = 'Can\'t be empty';
    } else if (_usernameController.value.text.length < 4) {
      _usernameErrorText = 'Too short';
    } else {
      _usernameErrorText = null;
    }
  }

  void _passwordValidate() {
    if (_passwordController.value.text.isEmpty) {
      _passwordErrorText = 'Can\'t be empty';
    } else if (_passwordController.value.text.length < 4) {
      _passwordErrorText = 'Too short';
    } else {
      _passwordErrorText = null;
    }
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
          Navigator.of(context).pop();
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
    final bodyHeight = sizeConfig.screenHeight - myAppbar.preferredSize.height;
    return Scaffold(
        appBar: myAppbar,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Container(
                margin: const EdgeInsets.only(left: 14),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: bodyHeight * 0.10,
            ),
            LoginCustomTextField(
              controller: _usernameController,
              errorText: _usernameErrorText,
              labelText: 'Username',
            ),
            SizedBox(
              height: bodyHeight * 0.01,
            ),
            LoginCustomTextField(
              controller: _passwordController,
              errorText: _passwordErrorText,
              labelText: 'Password',
            ),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 154,
                ),
                const Text(
                  'Forgot your password?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordView.routeName);
                    },
                    child: const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Color(0xFFDB3022),
                    ))
              ],
            ),
            SizedBox(
              height: bodyHeight * 0.04,
            ),
            Center(
              child: Consumer<LoginController>(
                builder: (_, value, __) {
                  return CustomButton(
                    function: () {
                      _usernameValidate();
                      _passwordValidate();
                      setState(() {});
                      value.login();
                    },
                    title: 'LOGIN',
                    widthSize: 128615 / bodyWidth,
                    heightSize: bodyHeight * 0.07,
                  );
                },
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.22,
            ),
            const Center(
              child: Text(
                'Or sign up with social account',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Center(
              child: FittedBox(
                child: Row(
                  children: <Widget>[
                    TextButton(
                        onPressed: () {},
                        child: Image.asset('assets/images/buttons/Google.png')),
                    TextButton(
                        onPressed: () {},
                        child:
                            Image.asset('assets/images/buttons/Facebook.png'))
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
