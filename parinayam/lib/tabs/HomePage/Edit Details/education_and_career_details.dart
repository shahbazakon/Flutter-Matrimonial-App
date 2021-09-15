import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import "package:nb_utils/src/extensions/int_extensions.dart";
import 'package:parinayam/model/post_data.dart';
import 'package:parinayam/screens/setting_screen.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';
import 'family_details.dart';
import 'personal_detail.dart';

class EducationAndCareers extends StatefulWidget {
  final userId;
  const EducationAndCareers({Key? key, @required this.userId}) : super(key: key);

  @override
  _EducationAndCareersState createState() => _EducationAndCareersState(userId);
}

class _EducationAndCareersState extends State<EducationAndCareers> {
  final userId;
  _EducationAndCareersState(this.userId);

  TextEditingController qualificationController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();


  var eduAndCarGET = "https://kiska.co.in/app/api/v1/edu_and_car/";
  var eduAndCarDataGET;

  @override
  void initState() {
    super.initState();
    geteduAndCarDetails();
  }

  geteduAndCarDetails() async {
    var eduAndCarDetailsRes = await Dio().get("$eduAndCarGET$userId");
    eduAndCarDataGET = eduAndCarDetailsRes.data;
    setState(() {});
  }

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
                                    builder: (context) => const SettingScreen()),
                              );
                            }),
                      ),
                    ])
          ]),
      body: SingleChildScrollView(
        child: Form(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            20.height,
            Text('Edit Your\nEducational Details',
                style: boldTextStyle(size: 30)),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: qualificationController/*..text = eduAndCarDataGET[0]['highest_qualification'] ?? ''*/,
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
              controller: workController/*..text = eduAndCarDataGET[0]['work_domain'] ?? ''*/,
              decoration: buildInputDecoration('Work Domain', 'Work Domain',
                  prefixIcon:
                      const Icon(Icons.height_outlined, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: designationController/*..text = eduAndCarDataGET[0]['designation'] */,
              decoration: buildInputDecoration('Designation', 'Designation',
                  prefixIcon:
                      const Icon(Icons.work_outline, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: organizationController/*..text = eduAndCarDataGET[0]['organization_name']*/,
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
              controller: salaryController/*..text = eduAndCarDataGET[0]['salary']*/,
              decoration: buildInputDecoration('Salary', 'Salary',
                  prefixIcon: const Icon(Icons.account_balance_wallet_outlined,
                      color: primaryColor)),
            ),
            16.height,
            Row(
              children: [
                AppButton(
                  padding: const EdgeInsets.all(12),
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

                if (eduAndCarDataGET == null) AppButton(
                  padding: const EdgeInsets.all(12),
                  color: primaryColor,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  text: 'Save Edits',
                  textStyle: primaryTextStyle(color: white),
                  onTap: () async {
                    print(
                        '1: ${qualificationController.text}\n 2: ${designationController.text}\n 3: ${workController.text}\n 4: ${organizationController.text}\n 5: ${salaryController.text}');
                    await editEduAndCar (
                      qualificationController.text,
                      designationController.text,
                      workController.text,
                      organizationController.text,
                      salaryController.text,
                    )
                        .editDetails(userId);

                  },
                ).expand() else AppButton(
                  padding: const EdgeInsets.all(12),
                  color: primaryColor,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  text: 'Save Details',
                  textStyle: primaryTextStyle(color: white),
                  onTap: () async {
                    print(
                        '1: ${qualificationController.text}\n 2: ${designationController.text}\n 3: ${workController.text}\n 4: ${organizationController.text}\n 5: ${salaryController.text}');
                    await AddEduAndCar (
                      qualificationController.text,
                      designationController.text,
                      workController.text,
                      organizationController.text,
                      salaryController.text,
                    )
                        .AddDetails(userId);

                    print('highest_qualification: $eduAndCarDataGET');
                    print('GET DATA: $eduAndCarDataGET ');
                    print('GET URL: ${"$eduAndCarGET$userId"} ');
                  },
                ).expand(),

                16.width,
                AppButton(
                  padding: const EdgeInsets.all(12),
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
      ),
    );
  }
}
