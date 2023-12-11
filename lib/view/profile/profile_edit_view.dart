import 'package:fitpang/common_widget/round_textfield.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/setting_edit_row.dart';
import 'package:fitpang/common_widget/photo_button.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/view/profile/profile_view.dart';

class ProfileEditView extends StatefulWidget {
  final int userId;
  final String f_name;
  final String l_name;
  const ProfileEditView({super.key, required this.userId, required this.f_name, required this.l_name});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                color: TColor.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/img/profile.png",
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                decoration: BoxDecoration(
                  color: TColor.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Divider(
                      color: TColor.black,
                      thickness: 1.5,
                    ),
                    RoundTextField(
                  hintText: widget.f_name,
                  icon: "assets/img/user.png",
                  controller: firstNameController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hintText: widget.l_name,
                  icon: "assets/img/user.png",
                  controller: lastNameController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                    Divider(
                      color: TColor.black,
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 180,
                    ),
                    RoundButton(
                      title: "Save",
                      onPressed: () async{
                        updateProfile(widget.userId, firstNameController.text, lastNameController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainTabView(userId: widget.userId,)
                          )
                        );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}