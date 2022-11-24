// import package
import 'package:fively_ecommerce/utils/size.dart';
import 'package:flutter/material.dart';

// import app
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field_email.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static const routeName = 'forget-password';

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
                  'Forgot password',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: bodyHeight * 0.12,
            ),
            Center(
              child: SizedBox(
                width: bodyWidth * 0.91,
                height: bodyHeight * 0.06,
                child: const Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: TextStyle(fontSize: 14),
                  // maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            const CustomTextFieldEmail(
              labelText: 'Email',
            ),
            SizedBox(
              height: bodyHeight * 0.01,
            ),
            SizedBox(
              height: bodyHeight * 0.04,
            ),
            Center(
              child: CustomButton(
                title: 'SEND',
                widthSize: 128615 / bodyWidth,
                heightSize: bodyHeight * 0.07,
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.12,
            ),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
