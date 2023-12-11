// ignore_for_file: use_build_context_synchronously

import 'package:fitpang/common/color_extension.dart';
import 'package:flutter/material.dart';

import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/common_widget/round_textfield.dart';
import 'package:fitpang/view/login/login_view.dart';
import 'package:fitpang/dbhelper.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool isCheck = false;
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2008),
      firstDate: DateTime(1908),
      lastDate: DateTime(2008,12,31),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                  "Create an Account",
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
                  hintText: "Firstname",
                  icon: "assets/img/user.png",
                  controller: firstNameController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hintText: "Lastname",
                  icon: "assets/img/user.png",
                  controller: lastNameController,
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
                RoundTextField(
                  hintText: "Confirm Password",
                  icon: "assets/img/lock.png",
                  obscureText: isConfirmPasswordObscured,
                  rightIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordObscured = !isConfirmPasswordObscured;
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: isConfirmPasswordObscured
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
                  controller: confirmpasswordController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'DATE OF BIRTH',
                      labelStyle: TextStyle(fontSize: 12.0),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: TColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "By continuing you accept our Privacy Policy and\nTerm of Use",
                        style: TextStyle(color: TColor.gray, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
                RoundButton(
                    title: "Register",
                    onPressed: () async {
                      final user = User(
                        email: emailController.text,
                        password: passwordController.text,
                        f_name: firstNameController.text,
                        l_name: lastNameController.text,
                        DOB: _dateController.text,
                      );
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                      final db = await opendb();
                      final existing_email = await db.query('user_account',
                          where: 'email=?', whereArgs: [user.email]);
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          firstNameController.text.isEmpty ||
                          lastNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please enter all the required information.'),
                          ),
                        );
                      } else if (existing_email.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('The following email is already exists.'),
                          ),
                        );
                      } else if (!emailRegex.hasMatch(user.email)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a valid email.'),
                          ),
                        );
                      } else if (passwordController.text !=
                          confirmpasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Password and Confirm Password do not match.'),
                          ),
                        );
                      } else if (!isCheck) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'You must accept our policy and term of use first.'),
                          ),
                        );
                      } else {
                        insertUser(user);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
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
                            builder: (context) => const LoginView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
