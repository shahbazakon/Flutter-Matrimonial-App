import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:parinayam/model/post_data.dart';
import 'package:parinayam/screens/setting_screen.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';

import 'personal_detail.dart';

class ProfileDetails extends StatefulWidget {
  final userId;

  const ProfileDetails({Key? key, @required this.userId}) : super(key: key);

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState(userId);
}

class _ProfileDetailsState extends State<ProfileDetails> {

  final userId;
  _ProfileDetailsState(this.userId);

  String maritalStatus = 'Unmarried';
  String genderValue = 'Male';
  TextEditingController DOBController = TextEditingController();
  TextEditingController TOBController = TextEditingController();
  TextEditingController first_name = TextEditingController();
  TextEditingController sceond_name = TextEditingController();
  TextEditingController nick_name = TextEditingController();
  TextEditingController mother_tongue = TextEditingController();
  TextEditingController heightControlar = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController castController = TextEditingController();
  TextEditingController subCastController = TextEditingController();




  var profileDetailsURL = "https://kiska.co.in/app/api/v1/personaldetails/";
  var profileDetailsData;

  @override
  void initState() {
    super.initState();
    getProfileDetails();
    init();
  }

  getProfileDetails() async {
    var PresonalDetailsRes = await Dio().get("$profileDetailsURL$userId");
    profileDetailsData = PresonalDetailsRes.data;
    setState(() {});
  }

  late DateTime DOB;

  Future<void> init() async {
    DOB = DateTime.now();
    DOBController.text = DateFormat('dd/MM/yyyy').format(DOB);
  }

  pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DOB,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year),
    );
    if (newDate != null) {
      setState(() {
        DOB = newDate;
        DOBController.text = DateFormat('dd/MM/yyyy').format(DOB);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String TOB = profileDetailsData[0]["TOB"];
    TOBController = TextEditingController();
    DOBController = TextEditingController();

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

    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Profile"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }
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
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Edit Your\nProfile Details',
                    style: boldTextStyle(size: 30)),
              ),
              16.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: AppTextField(
                        textStyle: primaryTextStyle(
                            weight: FontWeight.bold,
                            size: 18,
                            color: Colors.grey),
                        textFieldType: TextFieldType.OTHER,
                        cursorColor: primaryColor,
                        controller: first_name
                          ..text = profileDetailsData[0]["first_name"],
                        decoration:
                            buildInputDecoration('First Name', 'First Name'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AppTextField(
                        textStyle: primaryTextStyle(
                            weight: FontWeight.bold,
                            size: 18,
                            color: Colors.grey),
                        textFieldType: TextFieldType.OTHER,
                        cursorColor: primaryColor,
                        controller: sceond_name
                          ..text = profileDetailsData[0]["last_name"],
                        decoration:
                            buildInputDecoration('Second Name', 'Second Name'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Expanded(
                  child: AppTextField(
                    textStyle: primaryTextStyle(
                        weight: FontWeight.bold, size: 18, color: Colors.grey),
                    textFieldType: TextFieldType.OTHER,
                    cursorColor: primaryColor,
                    controller: nick_name
                      ..text = profileDetailsData[0]["nickname"],
                    decoration: buildInputDecoration('Nick Name', 'Nick Name'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Row(
                    children: [
                      const Text(
                        "Height :",
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: 90,
                          height: 48,
                          child: Expanded(
                            child: AppTextField(
                              textStyle: primaryTextStyle(
                                  weight: FontWeight.bold,
                                  size: 18,
                                  color: Colors.grey),
                              textFieldType: TextFieldType.OTHER,
                              cursorColor: primaryColor,
                              controller: heightControlar
                                ..text =
                                    profileDetailsData[0]["height"].toString(),
                              decoration: buildInputDecoration(
                                'Height',
                                '',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(8.0),
                          value: genderValue,
                          underline: null,
                          onChanged: (newValue) {

                            setState(() {

                              genderValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Male',
                            'Female',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: TextFormField(
                  // initialValue: profileDetailsData[0]["DOB"],
                  controller: DOBController..text = profileDetailsData[0]["DOB"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[500]),
                  decoration: InputDecoration(
                    labelText: "Date Of Birth",
                    labelStyle: const TextStyle(color: primaryColor),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[500]),
                    prefixIcon: const Icon(Icons.date_range, color: primaryColor),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: primaryColor, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: grey, width: 0.5)),
                  ),
                  onTap: () {
                    pickDate();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: TextFormField(
                  controller: TOBController..text = profileDetailsData[0]["TOB"],
                  // initialValue: profileDetailsData[0]["TOB"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[500]),
                  decoration: InputDecoration(
                    hintText: "Time Of Birth",
                    labelText: "Time Of Birth",
                    labelStyle: const TextStyle(color: primaryColor),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[500]),
                    prefixIcon:
                        const Icon(Icons.access_time, color: primaryColor),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: primaryColor, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: grey, width: 0.5)),
                  ),
                  onTap: () {
                    PickTime(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Expanded(
                  child: AppTextField(
                    textStyle: primaryTextStyle(
                        weight: FontWeight.bold, size: 18, color: Colors.grey),
                    textFieldType: TextFieldType.OTHER,
                    cursorColor: primaryColor,
                    controller: religionController
                      ..text = profileDetailsData[0]["religion"],
                    decoration: buildInputDecoration('Religion', 'Religion'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: AppTextField(
                        textStyle: primaryTextStyle(
                            weight: FontWeight.bold,
                            size: 18,
                            color: Colors.grey),
                        textFieldType: TextFieldType.OTHER,
                        cursorColor: primaryColor,
                        controller: castController
                          ..text = profileDetailsData[0]["caste"],
                        decoration: buildInputDecoration('Cast', 'Cast'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AppTextField(
                        textStyle: primaryTextStyle(
                            weight: FontWeight.bold,
                            size: 18,
                            color: Colors.grey),
                        textFieldType: TextFieldType.OTHER,
                        cursorColor: primaryColor,
                        controller: subCastController
                          ..text = profileDetailsData[0]["subcaste"],
                        decoration: buildInputDecoration('SubCast', 'SubCast'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Expanded(
                  child: AppTextField(
                    textStyle: primaryTextStyle(
                        weight: FontWeight.bold, size: 18, color: Colors.grey),
                    textFieldType: TextFieldType.OTHER,
                    cursorColor: primaryColor,
                    controller: cityController
                      ..text = profileDetailsData[0]["POB"],
                    decoration: buildInputDecoration(
                        'Place of Birth', 'Place of Birth',
                        prefixIcon: const Icon(Icons.location_on_outlined,
                            color: primaryColor)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Expanded(
                  child: AppTextField(
                    textStyle: primaryTextStyle(
                        weight: FontWeight.bold, size: 18, color: Colors.grey),
                    textFieldType: TextFieldType.OTHER,
                    cursorColor: primaryColor,
                    controller: mother_tongue
                      ..text = profileDetailsData[0]["mother_tongue"],
                    decoration: buildInputDecoration(
                        'Mother Tongue', 'Mother Tongue',
                        prefixIcon: const Icon(Icons.translate_rounded,
                            color: primaryColor)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text(
                    "Marital Status :",
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.5),
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
                            'Unmarried',
                            'Married',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(children: [
                  AppButton(
                    padding: const EdgeInsets.all(12),
                    color: primaryColor,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    text: 'Save Details',
                    textStyle: primaryTextStyle(color: white),
                    onTap: () async {
                      print(
                          '1: ${first_name.text}\n 2: ${sceond_name.text}\n 3: ${nick_name.text}\n 4: ${mother_tongue.text}\n 5: ${genderValue}\n 6: ${heightControlar.text} \n 7. ${DOBController.text} \n 8. ${TOBController.text} \n 9. ${cityController.text} \n 10. ${religionController.text} \n 11. ${castController.text} \n 12. ${subCastController.text} \n 13. ${maritalStatus}');
                      await editProfileDetails(
                              first_name.text,
                              sceond_name.text,
                              nick_name.text,
                              mother_tongue.text,
                              heightControlar.text,
                              genderValue,
                              DOBController.text,
                              TOBController.text,
                              cityController.text,
                              religionController.text,
                              castController.text,
                              subCastController.text,
                              maritalStatus)
                          .editDetails(userId);

                      showBottomSheet(
                          context: context,
                          builder: (BuildContext context) => Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.black)),
                                ),
                                child: ListView(
                                    shrinkWrap: true,
                                    primary: false,
                                    children: const [
                                      ListTile(
                                        dense: true,
                                        title: Text('Profile Details '),
                                      ),
                                      ListTile(
                                        dense: true,
                                        title: Text(
                                            "Chenges in Profile details Successfully"),
                                      ),
                                      ButtonBar(
                                        children: <Widget>[
                                          FlatButton(
                                            child: Text('OK'),
                                            onPressed: null,
                                          ),
                                        ],
                                      ),
                                    ]),
                              ));
                    },
                  ).expand(),
                  16.width,
                  AppButton(
                    padding: EdgeInsets.all(12),
                    text: 'Next',
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    textStyle: primaryTextStyle(),
                    onTap: () {
                      finish(context);
                      const PersonalDetails().launch(context);
                    },
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
