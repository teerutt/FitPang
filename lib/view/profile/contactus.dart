import 'package:fitpang/view/homedashboard/blank_view.dart';
import 'package:fitpang/view/profile/setting_notification_view.dart';
import 'package:flutter/material.dart';

import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/setting_setting_row.dart';

class ContactUs extends StatefulWidget {
  final int userId;
  const ContactUs({super.key, required this.userId});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
              "Contact Us",
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
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
          child: Column(
            children: [
              Divider(
                height: 1.5,
                color: TColor.black,
                thickness: 1.5,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Fitpang@gmail.com",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                height: 1.5,
                color: TColor.black,
                thickness: 1.5,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "023-456-789",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                height: 1.5,
                color: TColor.black,
                thickness: 1.5,
              ),
              SizedBox(
                height: 100.0,
              ),
              Text(
                "Mon to Fri: 9am - 9pm UTC+7",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Sat & Sun: 10am - 6pm UTC+7",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
