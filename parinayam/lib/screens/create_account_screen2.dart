import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/model/post_data.dart';
import 'package:parinayam/screens/upload_photo_screen.dart';
import 'package:parinayam/tabs/HomePage/home.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';

import '../main.dart';

class CreateAccountScreen2 extends StatefulWidget {
  final userId,
      first_name,
      sceond_name,
      nick_name,
      mother_tongue,
      heightControlar,
      genderValue;

  const CreateAccountScreen2(
      {Key? key,
      @required this.userId,
      this.first_name,
      this.sceond_name,
      this.nick_name,
      this.mother_tongue,
      this.heightControlar,
      this.genderValue})
      : super(key: key);

  @override
  CreateAccountScreen2State createState() => CreateAccountScreen2State(
      userId,
      first_name,
      sceond_name,
      nick_name,
      mother_tongue,
      heightControlar,
      genderValue);
}

class CreateAccountScreen2State extends State<CreateAccountScreen2> {
  final userId,
      first_name,
      sceond_name,
      nick_name,
      mother_tongue,
      heightControlar,
      genderValue;

  CreateAccountScreen2State(
      this.userId,
      this.first_name,
      this.sceond_name,
      this.nick_name,
      this.mother_tongue,
      this.heightControlar,
      this.genderValue);

  String  maritalStatus = 'Unmarried';
  String TOB = "Time Of Birth";

  TextEditingController DOBController = TextEditingController();
  TextEditingController TOBController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController religinController = TextEditingController();
  TextEditingController castController = TextEditingController();
  TextEditingController subCastController = TextEditingController();

  Future<void> PickTime(BuildContext context) async {
    final TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (newTime != null) {
      setState(() {
        TOB = newTime.format(context);
        TOBController.text = newTime.format(context);
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
    DOBController.text = DateFormat('dd/MM/yyyy').format(date);
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
        DOBController.text = DateFormat('dd/MM/yyyy').format(date);
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
              controller: DOBController..text="2001-02-01",
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              decoration: buildInputDecoration('Date of Birth', 'Date of Birth',
                  prefixIcon: Icon(Icons.date_range, color: primaryColor)),
              onTap: () {
                pickDate();
              },
            ),
            16.height,
            TextFormField(
              controller: TOBController..text = '10:30 AM',
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
                PickTime(context);
              },
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: cityController..text="Delhi",
              decoration: buildInputDecoration('City', 'City',
                  prefixIcon:
                      Icon(Icons.location_on_outlined, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: religinController..text = 'Demo',
              decoration: buildInputDecoration('Religion', 'Religion',
                  prefixIcon:
                      Icon(Icons.location_on_outlined, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: castController..text="Demo1",
              decoration: buildInputDecoration('Cast', 'Cast',
                  prefixIcon:
                      const Icon(Icons.person_outline, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              controller: subCastController..text = 'Demo2',
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
                      '1: ${first_name.text}\n 2: ${sceond_name.text}\n 3: ${nick_name.text}\n 4: ${mother_tongue.text}\n 5: ${genderValue}\n 6: ${heightControlar.text} \n 7. ${DOBController.text} \n 8. ${TOBController.text} \n 9. ${cityController.text} \n 10. ${religinController.text} \n 11. ${castController.text} \n 12. ${subCastController.text} \n 13. ${maritalStatus}');
                  await AddAccountDetails(
                          first_name.text,
                          sceond_name.text,
                          nick_name.text,
                          mother_tongue.text,
                          heightControlar.text,
                          genderValue,
                          DOBController.text,
                          TOBController.text,
                          cityController.text,
                          religinController.text,
                          castController.text,
                          subCastController.text,
                          maritalStatus)
                      .AddDetails(userId);
                  // finish(context);
                  // const UploadPhotoScreen().launch(context);
                  // MyHomePage(title: 'Parinayama',userId: userId);
                  //>>UploadPhotoScreen(userId: userId)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)  => MyHomePage(title: 'Parinayama',userId: userId)));
                  print("Secondry Details Added");
                  // const InterestScreen().launch(context);
                })
          ]).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
