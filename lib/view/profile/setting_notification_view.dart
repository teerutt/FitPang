// ignore_for_file: deprecated_member_use
import 'package:fitpang/view/profile/profile_edit_view.dart';
import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/setting_notification_row.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingNotificationView extends StatefulWidget {
  final int userId;
  const SettingNotificationView({super.key, required this.userId});

  @override
  State<SettingNotificationView> createState() => _SettingNotificationViewState();
}

class _SettingNotificationViewState extends State<SettingNotificationView> {
  
  List settingArr = [
    {
      "name": "Plan Reminders",
      "tag": "1",
    },
    {
      "name": "Events Notifications",
      "tag": "2"
    },
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
      return MaterialPageRoute(builder: (context) => ProfileEditView(userId: widget.userId,f_name: '',l_name: '',));
    }
    else {
      return MaterialPageRoute(builder: (context) => SettingNotificationView(userId: widget.userId,));
    }
  }

  Future<void> _launchPhoneSettings() async {
    const url = 'app-settings:';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  bool positive = false;
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
              "Notifications",
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                        return SettingNotificationRow(
                          title: iObj["name"].toString(),
                        );
                      },
                    ),
                    Divider(
                      color: TColor.black,
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: media.width
                    ),
                    InkWell(
                      onTap: () {
                        _launchPhoneSettings();
                      },
                      child: const Text(
                        "You can manage your app notification permission in your Phone Settings",
                        textAlign: TextAlign.center,
                      ),
                    )
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
