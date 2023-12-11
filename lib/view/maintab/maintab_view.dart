import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/tab_button.dart';
import 'package:fitpang/view/homedashboard/insight_view.dart';
import 'package:fitpang/view/homedashboard/update_plan.dart';
import 'package:fitpang/view/homedashboard/update_weight.dart';
import 'package:fitpang/view/profile/profile_view.dart';
import 'package:fitpang/view/homedashboard/notifications.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/view/homedashboard/home_noplan_view.dart';
import 'package:fitpang/view/homedashboard/home_haveplan_view.dart';
import 'package:fitpang/dbhelper.dart';

class MainTabView extends StatefulWidget {
  final int userId;
  const MainTabView({Key? key, required this.userId}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  late Widget currentTab = HomeNoPlan(userId: widget.userId);

  @override
  void initState() {
    super.initState();
    initTab();
  }

  Future<void> initTab() async {
    final hasPlan = await checkPlan(widget.userId);
    setState(() {
      currentTab = hasPlan
          ? HomeHavePlan(userId: widget.userId)
          : HomeNoPlan(userId: widget.userId);
    });
  }

  Future<bool> checkPlan(int userId) async {
    final db = await opendb();
    final plan = await db.query('plan', where: 'user_id=?', whereArgs: [userId]);
    return plan.isNotEmpty;
  }

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
                  onTap: () async {
                    selectTab = 0;
                    await checkPlan(widget.userId)
                        ? currentTab = HomeHavePlan(userId: widget.userId)
                        : currentTab = HomeNoPlan(userId: widget.userId);
                    if (mounted) {
                      setState(() {});
                    }
                  }),
              TabButton(
                  icon: "assets/img/insight_tab.png",
                  selectedIcon: "assets/img/insight_tab_selected.png",
                  isActive: selectTab == 1,
                  onTap: () async {
                    if (await checkPlan(widget.userId)) {
                      selectTab = 1;
                      currentTab = Insight2(
                          title: "YourTitleHere", userId: widget.userId);
                      if (mounted) {
                        setState(() {});
                      }
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
                    currentTab = ProfileView(userId: widget.userId);
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
