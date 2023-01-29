// import package
import 'package:email_validator/email_validator.dart';
import 'package:fively_ecommerce/module/login/view/login_view.dart';
import 'package:fively_ecommerce/module/signup/widget/signup_custom_textfield.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SignupView());
  }

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _usernameErrorText;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void didChangeDependencies() {
    /*
    every time we navigate to another TextField
    the build method called and can causing some UX issue
    to prevent that issue, we reassign the errorTexts to null 
    within this method because this method called with the build method
    */
    _usernameErrorText = null;
    _emailErrorText = null;
    _passwordErrorText = null;
    super.didChangeDependencies();
  }

  void _usernameValidate() {
    if (_usernameController.value.text.isEmpty) {
      _usernameErrorText = 'Can\'t be empty';
    } else if (_usernameController.value.text.length < 4) {
      _usernameErrorText = 'Too short';
    } else {
      _usernameErrorText = null;
    }
  }

  void _emailValidate(String email) {
    if (!EmailValidator.validate(email)) {
      _emailErrorText = 'Not a valid email address. Should be your@email.com';
    } else {
      _emailErrorText = null;
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

  void _signUp() {
    setState(() {});
    _usernameValidate();
    _emailValidate(_emailController.value.text);
    _passwordValidate();
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
                  'Sign up',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: bodyHeight * 0.10,
            ),
            SignupCustomTextField(
              controller: _usernameController,
              errorText: _usernameErrorText,
              labelText: 'Name',
            ),
            SizedBox(
              height: bodyHeight * 0.01,
            ),
            SignupCustomTextField(
              controller: _emailController,
              errorText: _emailErrorText,
              labelText: 'Email',
            ),
            SizedBox(
              height: bodyHeight * 0.01,
            ),
            SignupCustomTextField(
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
                  'Already have an account?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginView.routeName);
                      },
                      child: const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Color(0xFFDB3022),
                      )),
                )
              ],
            ),
            SizedBox(
              height: bodyHeight * 0.04,
            ),
            Center(
              child: CustomButton(
                function: (_usernameController.value.text.isEmpty &&
                        _emailController.value.text.isEmpty &&
                        _passwordController.value.text.isEmpty)
                    ? null
                    : _signUp,
                title: 'SIGN UP',
                widthSize: bodyWidth * 0.91,
                heightSize: bodyHeight * 0.07,
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.12,
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
        ),
      ),
    );
  }
}
