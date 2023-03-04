// import package
import 'package:fively_ecommerce/module/forgot_password/view/forgot_password_view.dart';
import 'package:fively_ecommerce/module/login/controller/login_controller.dart';
import 'package:fively_ecommerce/module/login/widget/custom_appbar_login.dart';
import 'package:fively_ecommerce/module/login/widget/login_custom_textfield.dart';
import 'package:fively_ecommerce/module/main/product_list/view/product_listview.dart';
import 'package:fively_ecommerce/module/profile/controller/profile_controller.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:fively_ecommerce/shared/widget/custom_button.dart';
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

  @override
  void didChangeDependencies() {
    /*
    every time we navigate to another TextField
    the build method called and can causing some UX issue
    to prevent that issue, we reassign the errorTexts to null 
    within this method because this method called with the build method
    */
    _usernameErrorText = null;
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
    return (_usernameValidate() && _passwordValidate()) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    LoginController provider = Provider.of<LoginController>(context);
    AuthState state = provider.state;

    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    String username = _usernameController.value.text;
    String password = _passwordController.value.text;

    bool issPressable = !(username.isEmpty && password.isEmpty) ? true : false;

    void login() {
      if (_validate()) {
        provider.login(username, password).then((value) {
          if (value['status']) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(
                  'User ${provider.user.username} ${provider.message.toLowerCase()}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
            Navigator.pushReplacementNamed(context, ProductListView.routeName);
          } else if (!value['status']) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(
                  provider.message,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        });
      }
    }

    return Scaffold(
      appBar: const CustomAppBarLogin(),
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
              labelText: 'Name',
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
                Flexible(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForgotPasswordView.routeName);
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
            if (state == AuthState.notLoggedIn) ...[
              Center(
                child: CustomButton(
                  function: (issPressable) ? login : null,
                  title: 'LOGIN',
                  widthSize: bodyWidth * 0.91,
                  heightSize: bodyHeight * 0.07,
                ),
              ),
            ] else if (state == AuthState.authenticating) ...[
              Column(
                children: [
                  const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  ),
                  SizedBox(
                    height: bodyHeight * 0.01,
                  ),
                  const Text('Logging .....')
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
                    Consumer<ProfileController>(
                      builder: (context, value, child) {
                        return TextButton(
                          onPressed: () async {
                            value.getCurretUser();
                            Navigator.of(context).pushReplacementNamed(
                                ProductListView.routeName);
                          },
                          child:
                              Image.asset('assets/images/buttons/Google.png'),
                        );
                      },
                    ),
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
