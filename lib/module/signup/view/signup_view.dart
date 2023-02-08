// import package
import 'package:email_validator/email_validator.dart';
import 'package:fively_ecommerce/module/login/view/login_view.dart';
import 'package:fively_ecommerce/module/signup/controller/signup_controller.dart';
import 'package:fively_ecommerce/module/signup/widget/custom_appbar.dart';
import 'package:fively_ecommerce/module/signup/widget/signup_custom_textfield.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  static const routeName = 'signup';

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

  bool _usernameValidate() {
    if (_usernameController.value.text.isEmpty) {
      _usernameErrorText = 'Can\'t be empty';
      return false;
    } else if (_usernameController.value.text.length < 4) {
      _usernameErrorText = 'Too short';
      return false;
    } else {
      _usernameErrorText = null;
      return true;
    }
  }

  bool _emailValidate(String email) {
    if (!EmailValidator.validate(email)) {
      _emailErrorText = 'Not a valid email address. Should be your@email.com';
      return false;
    } else {
      _emailErrorText = null;
      return true;
    }
  }

  bool _passwordValidate() {
    if (_passwordController.value.text.isEmpty) {
      _passwordErrorText = 'Can\'t be empty';
      return false;
    } else if (_passwordController.value.text.length < 4) {
      _passwordErrorText = 'Too short';
      return false;
    } else {
      _passwordErrorText = null;
      return true;
    }
  }

  bool _validate() {
    setState(() {});
    var username = _usernameValidate();
    var email = _emailValidate(_emailController.value.text);
    var password = _passwordValidate();
    if (username && email && password) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SignupController provider = Provider.of<SignupController>(context);
    AuthState state = provider.state;
    print('build state $state');

    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    String username = _usernameController.value.text;
    String email = _emailController.value.text;
    String password = _passwordController.value.text;

    bool issPressable =
        !(username.isEmpty && email.isEmpty && password.isEmpty) ? true : false;

    void signUp() {
      if (_validate()) {
        provider.signUp(username, email, password).then((value) {
          if (value['state'] == AuthState.registered) {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          }
        });
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(),
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
            if (state == AuthState.notRegistered) ...[
              Center(
                child: CustomButton(
                  function: (issPressable) ? signUp : null,
                  title: 'SIGN UP',
                  widthSize: bodyWidth * 0.91,
                  heightSize: bodyHeight * 0.07,
                ),
              ),
            ] else if (state == AuthState.registering) ...[
              Column(
                children: [
                  const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  ),
                  SizedBox(
                    height: bodyHeight * 0.01,
                  ),
                  const Text('Registering the user')
                ],
              )
            ],
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
