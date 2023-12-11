import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/view/login/signup_view.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/common_widget/round_textfield.dart';
import 'package:fitpang/dbhelper.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isCheck = false;
  bool isPasswordObscured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    double basePadding = 20;
    double baseVerticalSpacing = 25;

    // Adjust padding based on screen size
    double horizontalPadding =
        media.width > 600 ? basePadding * 0.8 : basePadding;
    double verticalPadding =
        media.height > 600 ? baseVerticalSpacing * 0.8 : baseVerticalSpacing;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hintText: "Email",
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hintText: "Password",
                  icon: "assets/img/lock.png",
                  obscureText: isPasswordObscured,
                  rightIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        isPasswordObscured = !isPasswordObscured;
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: isPasswordObscured
                            ? Image.asset(
                                "assets/img/hide_password.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              )
                            : Image.asset(
                                "assets/img/show_password.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              )),
                  ),
                  controller: passwordController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 10,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.5,
                ),
                RoundButton(
                    title: "Login",
                    onPressed: () async {
                      final db = await opendb();
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter email and password.'),
                          ),
                        );
                      } else {
                        final user = await db.query('user_account',
                            where: 'email=? AND password=?',
                            whereArgs: [
                              emailController.text,
                              passwordController.text
                            ]);
                        if (user.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Incorrect email and password.'),
                            ),
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainTabView(
                                      userId: user.first['user_id'] as int)));
                        }
                      }
                    }),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don’t have an account yet? ",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: media.width * 0.04,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
