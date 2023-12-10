import 'package:fitpang/view/homedashboard/blank_view.dart';
import 'package:fitpang/view/profile/contactus.dart';
import 'package:fitpang/view/profile/setting_notification_view.dart';
import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/setting_setting_row.dart';

class ProfileSettingView extends StatefulWidget {
  final int userId;
  const ProfileSettingView({super.key, required this.userId});

  @override
  State<ProfileSettingView> createState() => _ProfileSettingViewState();
}

class _ProfileSettingViewState extends State<ProfileSettingView> {
  List settingArr = [
    {
      "name": "Notifications",
      "tag": "1",
    },
    {"name": "Contact Us", "tag": "2"},
  ];

  void navigateToPage(String tag) {
    MaterialPageRoute<dynamic>? pageRoute;

    for (int i = 0; i < settingArr.length; i++) {
      var item;
      if (i < settingArr.length) {
        item = settingArr[i];
      }

      if (item["tag"] == tag) {
        pageRoute = generatePageRoute(tag);
        break;
      }
    }

    if (pageRoute != null) {
      Navigator.of(context).push(pageRoute);
    }
  }

  MaterialPageRoute<dynamic> generatePageRoute(String tag) {
    if (tag == "1") {
      return MaterialPageRoute(
          builder: (context) => SettingNotificationView(
                userId: widget.userId,
              ));
    } else if (tag == "2") {
      return MaterialPageRoute(
          builder: (context) => ContactUs(
                userId: widget.userId,
              ));
    } else {
      // Handle other cases or return a default route
      return MaterialPageRoute(
          builder: (context) => ProfileSettingView(
                userId: widget.userId,
              ));
    }
  }

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
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              "Settings",
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                // decoration: BoxDecoration(
                //   color: TColor.white,
                // ),
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
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: settingArr.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: TColor.black,
                          thickness: 1.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        var iObj = settingArr[index] as Map? ?? {};
                        return SettingSettingRow(
                          title: iObj["name"].toString(),
                          onPressed: () {
                            navigateToPage(iObj["tag"]);
                          },
                        );
                      },
                    ),
                    Divider(
                      color: TColor.black,
                      thickness: 1.5,
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
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
