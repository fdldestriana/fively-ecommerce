// import package
import 'package:fively_ecommerce/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  // bool _usernameValidate() {
  //   if (_usernameController.value.text.isEmpty) {
  //     _usernameErrorText = 'Can\'t be empty';
  //     return false;
  //   } else if (_usernameController.value.text.length < 4) {
  //     _usernameErrorText = 'Too short';
  //     return false;
  //   } else {
  //     _usernameErrorText = null;
  //     return true;
  //   }
  // }

  // bool _emailValidate(String email) {
  //   if (!EmailValidator.validate(email)) {
  //     _emailErrorText = 'Not a valid email address. Should be your@email.com';
  //     return false;
  //   } else {
  //     _emailErrorText = null;
  //     return true;
  //   }
  // }

  // bool _passwordValidate() {
  //   if (_passwordController.value.text.isEmpty) {
  //     _passwordErrorText = 'Can\'t be empty';
  //     return false;
  //   } else if (_passwordController.value.text.length < 4) {
  //     _passwordErrorText = 'Too short';
  //     return false;
  //   } else {
  //     _passwordErrorText = null;
  //     return true;
  //   }
  // }

  String? photoUrl;

  // bool _validate() {
  //   setState(() {});
  //   var username = _usernameValidate();
  //   var email = _emailValidate(_emailController.value.text);
  //   var password = _passwordValidate();
  //   if (username && email && password) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // SignupController provider = Provider.of<SignupController>(context);
    // AuthState state = provider.state;

    String username = _usernameController.value.text;
    String email = _emailController.value.text;
    String password = _passwordController.value.text;

    bool issPressable =
        !(username.isEmpty && email.isEmpty && password.isEmpty) ? true : false;

    // void signUp() {
    //   if (_validate()) {
    //     provider.signUp(username, email, password).then(
    //       (value) {
    //         if (value['status']) {
    //           ScaffoldMessenger.of(context).showSnackBar(
    //             SnackBar(
    //               duration: const Duration(seconds: 1),
    //               content: Text(
    //                 'User ${provider.user.username} ${provider.message.toLowerCase()}',
    //                 textAlign: TextAlign.center,
    //               ),
    //             ),
    //           );
    //           Navigator.pushReplacementNamed(context, LoginView.routeName);
    //         } else if (!value['status']) {
    //           ScaffoldMessenger.of(context).showSnackBar(
    //             SnackBar(
    //               duration: const Duration(seconds: 1),
    //               content: Text(
    //                 provider.message,
    //                 textAlign: TextAlign.center,
    //               ),
    //             ),
    //           );
    //         }
    //       },
    //     );
    //   }
    // }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: Get.height * 0.02),
              Container(
                margin: const EdgeInsets.only(left: 14),
                child: Text(
                  'Sign up',
                  style: GoogleFonts.roboto(
                      color: const Color(0xFF222222),
                      fontSize: 34,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ECircleAvatar(
                        avatarRadius: 40.0,
                        iconSize: 40.0,
                        bgCircleAvatar: Colors.grey[300] as Color,
                        bgIcon: Colors.black,
                        icon: Icons.person),
                    GestureDetector(
                      onTap: () async {
                        FirebaseStorageService firebaseStorageService =
                            FirebaseStorageService();
                        photoUrl = await firebaseStorageService.doUploadPhoto();
                      },
                      child: ECircleAvatar(
                        avatarRadius: 16.0,
                        iconSize: 16.0,
                        bgCircleAvatar: Colors.grey[400] as Color,
                        bgIcon: Colors.white,
                        icon: Icons.camera_alt,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              SignupCustomTextField(
                controller: _usernameController,
                errorText: _usernameErrorText,
                labelText: 'Name',
              ),
              SizedBox(height: Get.height * 0.01),
              SignupCustomTextField(
                controller: _emailController,
                errorText: _emailErrorText,
                labelText: 'Email',
              ),
              SizedBox(height: Get.height * 0.01),
              SignupCustomTextField(
                controller: _passwordController,
                errorText: _passwordErrorText,
                labelText: 'Password',
              ),
              SizedBox(height: Get.height * 0.02),
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
              SizedBox(height: Get.height * 0.04),
              // if (state == AuthState.notRegistered) ...[
              Center(
                child: CustomButton(
                  function: (issPressable)
                      ? () {
                          FirebaseAuthService.doEmailSignUp(
                              name: username,
                              email: email,
                              password: password,
                              photoProfile: photoUrl as String);
                        }
                      : null,
                  title: 'SIGN UP',
                  widthSize: Get.width * 0.91,
                  heightSize: Get.height * 0.07,
                ),
              ),

              SizedBox(height: Get.height * 0.08),
              const Center(
                child: Text(
                  'Or sign up with social account',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Center(
                child: FittedBox(
                  child: Row(
                    children: <Widget>[
                      TextButton(
                          onPressed: () {},
                          child:
                              Image.asset('assets/images/buttons/Google.png')),
                      TextButton(
                          onPressed: null,
                          child:
                              Image.asset('assets/images/buttons/Facebook.png'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
