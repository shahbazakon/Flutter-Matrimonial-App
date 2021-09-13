import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import "package:nb_utils/src/extensions/int_extensions.dart";
import 'package:parinayam/screens/setting_screen.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';
import 'family_details.dart';
import 'personal_detail.dart';

class EducationAndCareers extends StatefulWidget {
  const EducationAndCareers({Key? key}) : super(key: key);

  @override
  _EducationAndCareersState createState() => _EducationAndCareersState();
}

class _EducationAndCareersState extends State<EducationAndCareers> {
  dynamic genderdropdown = "Male";
  TextEditingController qualificationController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Education And Careers"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
                onSelected: (String value) {},
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ListTile(
                            leading: const Text(
                              "Settings",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingScreen()),
                              );
                            }),
                      ),
                    ])
          ]),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          20.height,
          Text('Edit Your\nEducational Details',
              style: boldTextStyle(size: 30)),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: qualificationController,
            decoration: buildInputDecoration(
                'Highest Qualification', 'Highest Qualification',
                prefixIcon:
                    const Icon(Icons.school_outlined, color: primaryColor)),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: workController,
            decoration: buildInputDecoration('Work Domain', 'Work Domain',
                prefixIcon:
                    const Icon(Icons.height_outlined, color: primaryColor)),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: designationController,
            decoration: buildInputDecoration('Designation', 'Designation',
                prefixIcon:
                    const Icon(Icons.work_outline, color: primaryColor)),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: organizationController,
            decoration: buildInputDecoration(
                'Organization Name', 'Organization Name',
                prefixIcon:
                    const Icon(Icons.home_work_outlined, color: primaryColor)),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: salaryController,
            decoration: buildInputDecoration('Salary', 'Salary',
                prefixIcon: const Icon(Icons.account_balance_wallet_outlined,
                    color: primaryColor)),
          ),
          16.height,
          Row(
            children: [
              AppButton(
                padding: EdgeInsets.all(12),
                text: 'Prev',
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                textStyle: primaryTextStyle(),
                onTap: () {
                  finish(context);
                  const PersonalDetails().launch(context);
                },
              ),
              16.width,
              AppButton(
                padding: const EdgeInsets.all(12),
                color: primaryColor,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                text: 'Save Details',
                textStyle: primaryTextStyle(color: white),
                onTap: () {},
              ).expand(),
              16.width,
              AppButton(
                padding: EdgeInsets.all(12),
                text: 'Next',
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                textStyle: primaryTextStyle(),
                onTap: () {
                  finish(context);
                  const FamilyDetails().launch(context);
                },
              )
            ],
          )
        ]).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
