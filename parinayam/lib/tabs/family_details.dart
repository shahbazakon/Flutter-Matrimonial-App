import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/screens/setting_screen.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';

import 'education_and_career_details.dart';

class FamilyDetails extends StatefulWidget {
  const FamilyDetails({Key? key}) : super(key: key);

  @override
  _FamilyDetailsState createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  String familyStatus="Middle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Family Details"),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          20.height,
          Text('Edit Your\nFamily Details', style: boldTextStyle(size: 30)),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            // controller: FnameController,
            decoration: buildInputDecoration("Father's Name", "Father's Name"),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            decoration: buildInputDecoration(
              "Father's Occupation",
              "Father's Occupation",
            ),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            decoration: buildInputDecoration("Mother's Name", "Mother's Name"),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            decoration: buildInputDecoration(
              "Mother's Occupation",
              "Mother's Occupation",
            ),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            decoration: buildInputDecoration(
                'Family Current Location', 'Family Current Location',
                prefixIcon: const Icon(Icons.location_city_outlined,
                    color: primaryColor)),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            decoration: buildInputDecoration(
                'Place-Ancestral/Native Place', 'Place-Ancestral/Native Place',
                prefixIcon: const Icon(Icons.location_on_outlined,
                    color: primaryColor)),
          ),
          16.height,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Family Status :",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(8.0),
                      value: familyStatus,
                      underline: null,
                      onChanged: (newValue) {
                        setState(() {
                          familyStatus = newValue!;
                        });
                      },
                      items: <String>[
                        'Rich','Middle', 'Lower','Poor',
                      ].map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            );
                          }).toList(),
                    ),
                ),
              ),
            )
          ]),
          16.height,
          Row(children: [
            AppButton(
              padding: const EdgeInsets.all(12),
              text: 'Prev',
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: primaryTextStyle(),
              onTap: () {
                finish(context);
                const EducationAndCareers().launch(context);
              },
            ),
            16.width,
            AppButton(
              padding: const EdgeInsets.all(12),
              color: primaryColor,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              text: 'Save Details',
              textStyle: primaryTextStyle(color: white),
              onTap: () {},
            ).expand(),
          ])
        ]).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
