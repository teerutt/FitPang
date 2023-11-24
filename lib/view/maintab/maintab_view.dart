import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/tab_button.dart';
import 'package:fitpang/view/homedashboard/insight2.dart';
import 'package:fitpang/view/homedashboard/update_plan.dart';
import 'package:fitpang/view/homedashboard/update_weight.dart';
import 'package:fitpang/view/profile/profile_view.dart';
import 'package:fitpang/view/homedashboard/notifications.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/view/homedashboard/home_noplan.dart';
import 'package:fitpang/view/homedashboard/home_haveplan.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeNoPlan();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(color: TColor.white, boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
          ]),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                  icon: "assets/img/home_tab.png",
                  selectedIcon: "assets/img/home_tab_selected.png",
                  isActive: selectTab == 0,
                  onTap: () {
                    selectTab = 0;
                    currentTab = const HomeNoPlan();
                    if (mounted) {
                      setState(() {});
                    }
                  }),
              TabButton(
                  icon: "assets/img/insight_tab.png",
                  selectedIcon: "assets/img/insight_tab_selected.png",
                  isActive: selectTab == 1,
                  onTap: () {
                    selectTab = 1;
                    currentTab = Insight2(title: "YourTitleHere");
                    if (mounted) {
                      setState(() {});
                    }
                  }),
              TabButton(
                  icon: "assets/img/notification_tab.png",
                  selectedIcon: "assets/img/notification_tab_selected.png",
                  isActive: selectTab == 2,
                  onTap: () {
                    selectTab = 2;
                    currentTab = const Notifications();
                    if (mounted) {
                      setState(() {});
                    }
                  }),
              TabButton(
                  icon: "assets/img/profile_tab.png",
                  selectedIcon: "assets/img/profile_tab_selected.png",
                  isActive: selectTab == 3,
                  onTap: () {
                    selectTab = 3;
                    currentTab = const ProfileView();
                    if (mounted) {
                      setState(() {});
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
