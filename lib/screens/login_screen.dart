import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';

import 'package:instagram_flutter/utils/color.dart';
import 'package:instagram_flutter/utils/utils.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

import '../responsive/mobilscreenlayout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_sccreen_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

// step  4.............................................................
  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authmethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == " success ") {
Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) =>  const ResponseiveLayout(
                  mobilscreenlayout: MobileScreenLayout(),
                  webscreenLayout: WebScreenLayout(),
                ),
        
        )
        );

      
//.............. steps for sliding or moving to the next page
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //   builder: (context) => const HomeScreen(),
      // ));
    } else {
      showSnackBar(res, context);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const signupScreen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(child: Container(), flex: 2),
          //svg img
          SvgPicture.asset(
            'assets/insta.svg',
            color: primaryColor,
            height: 64,
          ),
          const SizedBox(height: 64),
          //text filed email
          // TextFieldInput(
          TextFieldInput(
            hintText: 'Enter your email rani',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),
          const SizedBox(height: 25),
          //text field password
          TextFieldInput(
            hintText: 'Enter your password rani',
            textInputType: TextInputType.text,
            textEditingController: _passwordController,
            isPass: true,
          ),
          const SizedBox(height: 25),
          //button login
          InkWell(
            onTap: loginUser,
            child: Container(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : const Text('Log In'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  )),
                  color: blueColor),
            ),
          ),
          const SizedBox(height: 25),
          Flexible(child: Container(), flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text("don't have an account?"),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
              ),
              GestureDetector(
                onTap: navigateToSignup,
                child: Container(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    ));
  }
}
