import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/setting_edit_row.dart';
import 'package:fitpang/common_widget/photo_button.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/view/profile/profile_view.dart';

class ProfileEditView extends StatefulWidget {
  final int userId;
  const ProfileEditView({super.key, required this.userId});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  @override
  void initState() {
    super.initState();
  }

  List profileArr = [
    {
      "label": "Firstname",
      "name": "Teerut",
      "tag": "1",
    },
    {"label": "Lastname", "name": "P", "tag": "2"},
    {"label": "Email", "name": "fitpang@gmail.com", "tag": "3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 60, // Set the width to accommodate the back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: TColor.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                      Positioned(
                        left: 80,
                        top: 80,
                        child: PhotoButton(onTap: () {}),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                  color: TColor.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListView.separated(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   itemCount: profileArr.length,
                    //   separatorBuilder: (context, index) {
                    //     return Divider(
                    //       color: TColor.black,
                    //       thickness: 1.5,
                    //     );
                    //   },
                    //   itemBuilder: (context, index) {
                    //     var iObj = profileArr[index] as Map? ?? {};
                    //     return SettingEditRow(
                    //       label: iObj["label"].toString(),
                    //       title: iObj["name"].toString(),
                    //       onPressed: () {
                    //         // navigateToPage(iObj["tag"]);
                    //       },
                    //     );
                    //   },
                    // ),
                    BuildTextField("Name", "Bundit"),
                    BuildTextField("Surname", "Than-iam"),
                    BuildTextField("Email", "kuynahee@gmail.com"),
                    // Divider(
                    //   color: TColor.black,
                    //   thickness: 1.5,
                    // ),
                    const SizedBox(
                      height: 100,
                    ),
                    RoundButton(
                        title: "Save",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileView(
                                        userId: widget.userId,
                                      )));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
          decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      )),
    );
  }
}
