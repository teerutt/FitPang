import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/view/login/login_view.dart';
import 'package:fitpang/view/profile/profile_edit_view.dart';
import 'package:fitpang/view/profile/profile_setting_view.dart';
import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/setting_row.dart';
import 'package:fitpang/common_widget/gradient_circular.dart';

class ProfileView extends StatefulWidget {
  final int userId;
  const ProfileView({super.key, required this.userId});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late User user = User(
    f_name: '',
    l_name: '',
    email: '',
    password: '',
    DOB: '',
  );
  bool positive = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final loadedUser = await getUser(widget.userId);
    setState(() {
      user = User(
        user_id: loadedUser['user_id'],
        f_name: loadedUser['f_name'],
        l_name: loadedUser['l_name'],
        email: loadedUser['email'],
        password: loadedUser['password'],
        DOB: loadedUser['DOB'],
      );
    });
  }

  List accountArr = [
    {
      "image": "assets/img/profile_personal.png",
      "name": "Edit Profile",
      "tag": "1",
    },
    {"image": "assets/img/profile_setting.png", "name": "Settings", "tag": "2"}
  ];

  List signoutArr = [
    {"image": "assets/img/profile_logout.png", "name": "Sign Out", "tag": "3"}
  ];

  void navigateToPage(String tag) {
    MaterialPageRoute<dynamic>? pageRoute;

    for (int i = 0; i < accountArr.length + signoutArr.length; i++) {
      var item;
      if (i < accountArr.length) {
        item = accountArr[i];
      } else {
        item = signoutArr[i - accountArr.length];
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
          builder: (context) => ProfileEditView(
                userId: widget.userId,
                f_name: user.f_name,
                l_name: user.l_name,
              ));
    } else if (tag == "2") {
      return MaterialPageRoute(
          builder: (context) => ProfileSettingView(userId: widget.userId));
    } else if (tag == "3") {
      return MaterialPageRoute(builder: (context) => const LoginView());
    } else {
      // Handle other cases or return a default route
      return MaterialPageRoute(
          builder: (context) => ProfileView(
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
        leadingWidth: 0,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child: Container(
            margin: const EdgeInsets.only(top: 40, bottom: 40),
            child: Text(
              "Profile",
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
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
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          child: GradientCircularProgressIndicator(
                            radius: 60,
                            gradient: LinearGradient(
                              colors: TColor.primaryG,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            value: 0.7,
                            strokeWidth: 4,
                            backgroundColor: TColor.midGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                    Text(
                      user.f_name,
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      user.l_name,
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                      itemCount: accountArr.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: TColor.black,
                          thickness: 1.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        var iObj = accountArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
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
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: signoutArr.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: TColor.black,
                          thickness: 1.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        var iObj = signoutArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {
                            navigateToPage(iObj["tag"]);
                          },
                        );
                      },
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
