// import package
import 'package:fively_ecommerce/pages/forgot_password_page.dart';
import 'package:fively_ecommerce/utils/size.dart';
import 'package:flutter/material.dart';

// import app
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = 'login';

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
    final bodyHeight = sizeConfig.bodyheight - myAppbar.preferredSize.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
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
            const CustomTextField(
              labelText: 'Email',
            ),
            SizedBox(
              height: bodyHeight * 0.01,
            ),
            const CustomTextField(labelText: 'Password'),
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
                          .pushNamed(ForgetPasswordPage.routeName);
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
              child: CustomButton(
                title: 'LOGIN',
                widthSize: 128615 / bodyWidth,
                heightSize: bodyHeight * 0.07,
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
        ),
      ),
    );
  }
}
