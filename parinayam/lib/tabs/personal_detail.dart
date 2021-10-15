import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/api%20requests/post_data.dart';
import 'package:parinayam/screens/setting_screen.dart';
import 'package:parinayam/tabs/profile_details.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';
import 'education_and_career_details.dart';

class PersonalDetails extends StatefulWidget {
  final userId;
  const PersonalDetails({Key? key, this.userId}) : super(key: key);

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState(userId);
}
class _PersonalDetailsState extends State<PersonalDetails> {
  final userId;
  _PersonalDetailsState(this.userId);



  String? bodyShapeValue = 'Fit';
  String bloodGroupValue = 'Select';
  TextEditingController bioController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController gothramController = TextEditingController();
  TextEditingController mgothramController = TextEditingController();
  TextEditingController doshamController = TextEditingController();
  TextEditingController starController = TextEditingController();
  TextEditingController raasiController = TextEditingController();


  var presonalDetailsGET = "https://matrimonial.kiska.co.in/app/api/v1/personaldetails/";
  var presonalDataGET;


  @override
  void initState() {
    super.initState();
    getPresonalDetails();
  }

  getPresonalDetails() async{
    var PresonalGETRes = await Dio().get("$presonalDetailsGET$userId");
    presonalDataGET = PresonalGETRes.data;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Personal Details"),
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
          Text('Edit Your\nPersonal Details',
              style: boldTextStyle(size: 30)),
          16.height,
          TextField(
            controller: bioController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              labelText:"Bio",
              hintText: "Bio",
              fillColor: primaryColor, filled: true,
              labelStyle: const TextStyle(color: black,fontWeight: FontWeight.bold,fontSize: 25),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: primaryColor, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: grey, width: 0.5)),
            ),
          ),
          16.height,
          AppTextField(

            // initialValue: bioController.text,
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: locationController,
            decoration: buildInputDecoration('Location','Location',
                prefixIcon: const Icon(Icons.add_location, color: primaryColor)),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: gothramController,
            decoration: buildInputDecoration('Gothram','Gothram',
                ),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: mgothramController,
            decoration: buildInputDecoration('Maternal Gothram','Maternal Gothram',
                ),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: doshamController,
            decoration: buildInputDecoration('Dosham','Dosham',
                ),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: starController,
            decoration: buildInputDecoration('Star','Star',
                ),
          ),
          16.height,
          AppTextField(
            textStyle: primaryTextStyle(color: black),
            textFieldType: TextFieldType.OTHER,
            cursorColor: primaryColor,
            controller: raasiController,
            decoration: buildInputDecoration('Raasi','Raasi',
                ),
          ),
          16.height,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Body Shape :",
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
                    value: bodyShapeValue,
                    underline: null,
                    onChanged: (newValue) {
                      setState(() {
                        bodyShapeValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Healty','Fit', 'Lanky',
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Blood Group :",
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
                    value: bloodGroupValue,
                    underline: null,
                    onChanged: (newValue) {
                      setState(() {
                        bloodGroupValue = newValue!;
                      });
                    },
                    items: <String>[
                     'Select', 'A','B', 'AB','O',
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                AppButton(
                  padding: const EdgeInsets.all(12),
                  text: 'Prev',
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  textStyle: primaryTextStyle(),
                  onTap: () {
                    finish(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetails(userId: userId)));
                  },
                ),
                16.width,
                presonalDataGET != null ?
                AppButton(
                  padding: const EdgeInsets.all(12),
                  color: primaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  text: 'Save Details',
                  textStyle: primaryTextStyle(color: white),
                  onTap: () async {
                    print(
                        '1: $bodyShapeValue\n 2: ${bloodGroupValue}\n 3: ${bioController.text}\n 4: ${locationController.text}\n 5: ${gothramController.text}\n 6: ${mgothramController.text} \n 7. ${doshamController.text} \n 8. ${starController.text} \n 9. ${raasiController.text}');
                    await AddPresonalDetails (
                        bodyShapeValue,
                        bloodGroupValue,
                        bioController.text,
                        locationController.text,
                        gothramController.text,
                        mgothramController.text,
                        doshamController.text,
                        starController.text,
                        raasiController.text)
                        .addDetails(userId);
                  },
                ).expand():
                AppButton(
                  padding: const EdgeInsets.all(12),
                  color: primaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  text: 'Save Edits',
                  textStyle: primaryTextStyle(color: white),
                  onTap: () async {
                    print(
                        '1: $bodyShapeValue\n 2: $bloodGroupValue\n 3: ${bioController.text}\n 4: ${locationController.text}\n 5: ${gothramController.text}\n 6: ${mgothramController.text} \n 7. ${doshamController.text} \n 8. ${starController.text} \n 9. ${raasiController.text}');
                    await editPresonalDetails (
                        bodyShapeValue,
                        bloodGroupValue,
                        bioController.text,
                        locationController.text,
                        gothramController.text,
                        mgothramController.text,
                        doshamController.text,
                        starController.text,
                        raasiController.text)
                        .editDetails(userId);
                  },
                ).expand(),



                16.width,
                AppButton(
                  padding: const EdgeInsets.all(12),
                  text: 'Next',
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  textStyle: primaryTextStyle(),
                  onTap: () {
                    finish(context);
                    const EducationAndCareers().launch(context);
                  },
                ),

              ],
            ),
          )
        ]).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
