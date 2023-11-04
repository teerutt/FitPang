import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/setting_row.dart';
import 'package:fitpang/common_widget/gradient_circular.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool positive = false;

  List accountArr = [
    {
      "image": "assets/img/profile_personal.png",
      "name": "Edit Profile",
      "tag": "1"
    },
    {
      "image": "assets/img/profile_achievement.png",
      "name": "Personal Plan",
      "tag": "2"
    },
    {
      "image": "assets/img/profile_privacy.png",
      "name": "Privacy Policy",
      "tag": "3"
    },
    {"image": "assets/img/profile_setting.png", "name": "Settings", "tag": "4"}
  ];

  List signoutArr = [
    {"image": "assets/img/profile_logout.png", "name": "Sign Out", "tag": "5"}
  ];

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
            margin: const EdgeInsets.only(top: 40),
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
                    Container(
                      width: 1.2,
                      height: 75,
                      color: TColor.black,
                      margin: const EdgeInsets.only(left: 55, right: 40),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Joined",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "2 months ago",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
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
                      "Teerut",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "P",
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
                        // void navigateToSettingPage() {
                        //   switch (iObj["tag"]) {
                        //     case "1":
                        //       // Navigate to the Edit Profile page
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => BlankView(),
                        //         ),
                        //       );
                        //       break;
                        //     // case "2":
                        //     //   // Navigate to the Personal Plan page
                        //     //   Navigator.push(
                        //     //     context,
                        //     //     MaterialPageRoute(
                        //     //       builder: (context) => PersonalPlanPage(),
                        //     //     ),
                        //     //   );
                        //     //   break;
                        //     // case "3":
                        //     //   // Navigate to the Privacy Policy page
                        //     //   Navigator.push(
                        //     //     context,
                        //     //     MaterialPageRoute(
                        //     //       builder: (context) => PrivacyPolicyPage(),
                        //     //     ),
                        //     //   );
                        //     //   break;
                        //     // case "4":
                        //     //   // Navigate to the Settings page
                        //     //   Navigator.push(
                        //     //     context,
                        //     //     MaterialPageRoute(
                        //     //       builder: (context) => SettingsPage(),
                        //     //     ),
                        //     //   );
                        //     //   break;
                        //     // default:
                        //     //   // Handle other cases or do nothing
                        //     //   break;
                        //   }
                        // }
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {},
                        );
                      },
                    ),
                    Divider(
                      color: TColor.black,
                      thickness: 1.5,
                    ),
<<<<<<< HEAD
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: TColor.gray,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: TColor.red,
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 2)
                                      ]),
                                  child: Text(
                                    "PRO",
                                    style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Upgrade to Pro",
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "This subscription is auto-renewable",
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // CustomAnimatedToggleSwitch<bool>(
                          //   current: positive,
                          //   values: const [false, true],
                          //   // dif: 0.0,
                          //   indicatorSize: const Size.square(30.0),
                          //   animationDuration:
                          //       const Duration(milliseconds: 200),
                          //   animationCurve: Curves.linear,
                          //   onChanged: (b) => setState(() => positive = b),
                          //   iconBuilder: (context, local, global) {
                          //     return const SizedBox();
                          //   },
                          //   cursors: const ToggleCursors(
                          //       defaultCursor: SystemMouseCursors.click),
                          //   onTap: (_) => setState(() => positive = !positive),
                          //   iconsTappable: false,
                          //   wrapperBuilder: (context, global, child) {
                          //     return Stack(
                          //       alignment: Alignment.center,
                          //       children: [
                          //         Positioned(
                          //             left: 10.0,
                          //             right: 10.0,
                          //             height: 30.0,
                          //             child: DecoratedBox(
                          //               decoration: BoxDecoration(
                          //                 gradient: positive
                          //                     ? LinearGradient(
                          //                         colors: TColor.primaryG)
                          //                     : null,
                          //                 color: TColor.midGray,
                          //                 borderRadius: const BorderRadius.all(
                          //                     Radius.circular(50.0)),
                          //               ),
                          //             )),
                          //         child,
                          //       ],
                          //     );
                          //   },
                          //   foregroundIndicatorBuilder: (context, global) {
                          //     return SizedBox.fromSize(
                          //       size: const Size(10, 10),
                          //       child: DecoratedBox(
                          //         decoration: BoxDecoration(
                          //           color: TColor.white,
                          //           borderRadius: const BorderRadius.all(
                          //               Radius.circular(50.0)),
                          //           boxShadow: const [
                          //             BoxShadow(
                          //                 color: Colors.black38,
                          //                 spreadRadius: 0.05,
                          //                 blurRadius: 1.1,
                          //                 offset: Offset(0.0, 0.8))
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: TColor.black,
                      thickness: 1.5,
                    ),
=======
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    //   decoration: BoxDecoration(
                    //       color: TColor.gray,
                    //       borderRadius: BorderRadius.circular(15),
                    //       boxShadow: const [
                    //         BoxShadow(color: Colors.black12, blurRadius: 2)
                    //       ]),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Container(
                    //               padding:
                    //                 const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    //               decoration: BoxDecoration(
                    //                 color: TColor.red,
                    //                 borderRadius: BorderRadius.circular(7),
                    //                 boxShadow: const [
                    //                   BoxShadow(color: Colors.black12, blurRadius: 2)
                    //                 ]
                    //               ),
                    //               child: Text(
                    //                 "PRO",
                    //                 style: TextStyle(
                    //                   color: TColor.white,
                    //                   fontSize: 10,
                    //                   fontWeight: FontWeight.w700,
                    //                 ),
                    //               ),
                    //             ),
                    //             Text(
                    //               "Upgrade to Pro",
                    //               style: TextStyle(
                    //                 color: TColor.white,
                    //                 fontSize: 16,
                    //                 fontWeight: FontWeight.w700,
                    //               ),
                    //             ),
                    //             Text(
                    //               "This subscription is auto-renewable",
                    //               style: TextStyle(
                    //                 color: TColor.white,
                    //                 fontSize: 12,
                    //                 fontWeight: FontWeight.w400,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       CustomAnimatedToggleSwitch<bool>(
                    //         current: positive,
                    //         values: const [false, true],
                    //         // dif: 0.0,
                    //         indicatorSize: const Size.square(30.0),
                    //         animationDuration:
                    //             const Duration(milliseconds: 200),
                    //         animationCurve: Curves.linear,
                    //         onChanged: (b) => setState(() => positive = b),
                    //         iconBuilder: (context, local, global) {
                    //           return const SizedBox();
                    //         },
                    //         cursors: const ToggleCursors(defaultCursor: SystemMouseCursors.click),
                    //         onTap: (_) => setState(() => positive = !positive),
                    //         iconsTappable: false,
                    //         wrapperBuilder: (context, global, child) {
                    //           return Stack(
                    //             alignment: Alignment.center,
                    //             children: [
                    //               Positioned(
                    //                 left: 10.0,
                    //                 right: 10.0,
                    //                 height: 30.0,
                    //                 child: DecoratedBox(
                    //                   decoration: BoxDecoration(
                    //                     gradient: positive
                    //                     ? LinearGradient(colors: TColor.primaryG)
                    //                     : null,
                    //                     color: TColor.midGray,
                    //                     borderRadius:
                    //                         const BorderRadius.all(
                    //                             Radius.circular(50.0)),
                    //                   ),
                    //                 )
                    //               ),
                    //               child,
                    //             ],
                    //           );
                    //         },
                    //         foregroundIndicatorBuilder: (context, global) {
                    //           return SizedBox.fromSize(
                    //             size: const Size(10, 10),
                    //             child: DecoratedBox(
                    //               decoration: BoxDecoration(
                    //                 color: TColor.white,
                    //                 borderRadius: const BorderRadius.all(
                    //                   Radius.circular(50.0)),
                    //                 boxShadow: const [
                    //                   BoxShadow(
                    //                     color: Colors.black38,
                    //                     spreadRadius: 0.05,
                    //                     blurRadius: 1.1,
                    //                     offset: Offset(0.0, 0.8))
                    //                 ],
                    //               ),
                    //             ),
                    //           );
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // Divider(
                    //   color: TColor.black,
                    //   thickness: 1.5,
                    // ),
>>>>>>> 64642b85a4c7940d09b3932513b19cfe0be48d08
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
                        bool showArrowRight = iObj["tag"] != "5";
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {},
                          showArrowRight: showArrowRight,
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
