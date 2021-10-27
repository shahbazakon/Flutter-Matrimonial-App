import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/api%20requests/post_data.dart';
import 'package:parinayam/screens/upload_photo_screen.dart';
import 'package:parinayam/tabs/home.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';

import '../main.dart';

class CreateAccountScreen2 extends StatefulWidget {
  final userId,
      firstName,
      secondName,
      nickName,
      motherTongue,
      heightController,
      genderValue;

  const CreateAccountScreen2(
      {Key? key,
      @required this.userId,
      this.firstName,
      this.secondName,
      this.nickName,
      this.motherTongue,
      this.heightController,
      this.genderValue})
      : super(key: key);

  @override
  CreateAccountScreen2State createState() => CreateAccountScreen2State(
      userId,
      firstName,
      secondName,
      nickName,
      motherTongue,
      heightController,
      genderValue);
}

class CreateAccountScreen2State extends State<CreateAccountScreen2> {
  final userId,
      firstName,
      secondName,
      nickName,
      motherTongue,
      heightController,
      genderValue;

  CreateAccountScreen2State(
      this.userId,
      this.firstName,
      this.secondName,
      this.nickName,
      this.motherTongue,
      this.heightController,
      this.genderValue);

  String  maritalStatus = 'Unmarried';
  String TOB = "Time Of Birth";

  TextEditingController dobController = TextEditingController();
  TextEditingController tobController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController castController = TextEditingController();
  TextEditingController subCastController = TextEditingController();

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (newTime != null) {
      setState(() {
        TOB = newTime.format(context);
        tobController.text = newTime.format(context);
      });
    }
  }

  FocusNode emailFocus = FocusNode();
  late DateTime date;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    date = DateTime.now();
    dobController.text = DateFormat('dd/MM/yyyy').format(date);
  }

  pickDate() async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (time != null) {
      setState(() {
        date = time;
        dobController.text = DateFormat('dd/MM/yyyy').format(date);
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget('Parinayam',
            center: true, titleTextStyle: boldTextStyle(size: 25)),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            16.height,
            Text('Add more \nDetails', style: boldTextStyle(size: 30)),
            16.height,
            Text('Fill all the Details', style: primaryTextStyle()),
            16.height,
            AppTextField(
              controller: dobController,
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              decoration: buildInputDecoration('Date of Birth', 'Date of Birth',
                  prefixIcon: const Icon(Icons.date_range, color: primaryColor)),
              onTap: () {
                pickDate();
              },
            ),
            16.height,
            TextFormField(
              controller: tobController,
              decoration: InputDecoration(
                hintText: TOB,
                prefixIcon: const Icon(Icons.access_time, color: primaryColor),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
              onTap: () {
                pickTime(context);
              },
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: cityController,
              decoration: buildInputDecoration('City', 'City',
                  prefixIcon:
                      Icon(Icons.location_on_outlined, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: religionController,
              decoration: buildInputDecoration('Religion', 'Religion',
                  prefixIcon:
                      Icon(Icons.location_on_outlined, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: castController,
              decoration: buildInputDecoration('Cast', 'Cast',
                  prefixIcon:
                      const Icon(Icons.person_outline, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: subCastController,
              decoration: buildInputDecoration('SubCast', 'SubCast',
                  prefixIcon:
                      const Icon(Icons.person_outline, color: primaryColor)),
            ),
            16.height,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Marital Status :",
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
                      value: maritalStatus,
                      underline: null,
                      onChanged: (newValue) {
                        setState(() {
                          maritalStatus = newValue!;
                        });
                      },
                      items: <String>[
                        'Unmarried','Married',
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
            AppButton(
                text: 'Continue',
                textStyle: boldTextStyle(color: white),
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                width: context.width(),
                color: primaryColor,
                onTap: () async {
                  print("Adding Secondry Details");

                  print(
                      '1: ${firstName.text}\n 2: ${secondName.text}\n 3: ${nickName.text}\n 4: ${motherTongue.text}\n 5: $genderValue\n 6: ${heightController.text} \n 7. ${dobController.text} \n 8. ${tobController.text} \n 9. ${cityController.text} \n 10. ${religionController.text} \n 11. ${castController.text} \n 12. ${subCastController.text} \n 13. $maritalStatus');
                  await AddAccountDetails(
                          firstName.text,
                          secondName.text,
                          nickName.text,
                          motherTongue.text,
                          heightController.text,
                          genderValue,
                          dobController.text,
                          tobController.text,
                          cityController.text,
                          religionController.text,
                          castController.text,
                          subCastController.text,
                          maritalStatus)
                      .AddDetails(userId);
                  // finish(context);
                  // const UploadPhotoScreen().launch(context);
                  // MyHomePage(title: 'Parinayama',userId: userId);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)  => UploadPhotoScreen(userId: userId)));
                  print("Secondry Details Added");
                  // const InterestScreen().launch(context);
                })
          ]).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('userId', userId));
    properties.add(DiagnosticsProperty('userId', userId));
  }
}
