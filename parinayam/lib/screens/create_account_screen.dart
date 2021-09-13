import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';

import 'create_account_screen2.dart';

class CreateAccountScreen extends StatefulWidget {
  final userId;

  const CreateAccountScreen({Key? key, @required this.userId})
      : super(key: key);

  @override
  CreateAccountScreenState createState() => CreateAccountScreenState(userId);
}

class CreateAccountScreenState extends State<CreateAccountScreen> {
  final userId;
  CreateAccountScreenState(this.userId);

  String genderValue = 'Male';
  TextEditingController first_name = TextEditingController();
  TextEditingController sceond_name = TextEditingController();
  TextEditingController nick_name = TextEditingController();
  TextEditingController mother_tongue = TextEditingController();
  TextEditingController heightControlar = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  late DateTime date;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    date = DateTime.now();
    dateController.text = DateFormat('dd/MM/yyyy').format(date);
  }

  pickDate() async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (time != null) {
      setState(() {
        date = time;
        dateController.text = DateFormat('dd/MM/yyyy').format(date);
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
            Text('Create your \naccount', style: boldTextStyle(size: 30)),
            16.height,
            Text('Sign up and get started!', style: primaryTextStyle()),
            16.height,
            AppTextField(
              controller: first_name,
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.EMAIL,
              cursorColor: primaryColor,
              decoration: buildInputDecoration('First Name', 'First Name',
                  prefixIcon: const Icon(Icons.person_add_outlined,
                      color: primaryColor)),
            ),
            16.height,
            AppTextField(
              controller: sceond_name,
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              decoration: buildInputDecoration('Second Name', 'Second Name',
                  prefixIcon: const Icon(Icons.person_add_alt_1_outlined,
                      color: primaryColor)),
            ),
            16.height,
            AppTextField(
              controller: nick_name,
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              decoration: buildInputDecoration('Nick Name', 'Nick Name',
                  prefixIcon:
                      const Icon(Icons.person_outline, color: primaryColor)),
            ),
            16.height,
            AppTextField(
              controller: mother_tongue,
              textStyle: primaryTextStyle(color: black),
              textFieldType: TextFieldType.OTHER,
              cursorColor: primaryColor,
              decoration: buildInputDecoration('Mother Tongue', 'Mother Tongue',
                  prefixIcon:
                      const Icon(Icons.translate_rounded, color: primaryColor)),
            ),
            16.height,
            // AccountExpansionWidget(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Gender :",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                      color: Colors.grey, style: BorderStyle.solid, width: 0.5),
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
                        'Male','Female',
                      ].map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text( value,
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
              Row(children: [
                const Text(
                  "Height :",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                24.width,
                SizedBox(
                  width: 135,
                  height: 50,
                  child: Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: heightControlar,
                      cursorColor: primaryColor,
                      cursorRadius: const Radius.circular(10),
                      decoration: const InputDecoration(
                        hintText: "Height",
                        prefixIcon: Icon(
                          Icons.height_rounded,
                          color: primaryColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: primaryColor, width: 1)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
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
                  print("Adding primary details ");
                  // print("1: ${first_name.text}\n 2: ${sceond_name.text}\n 3: ${nick_name.text}\n 4: ${mother_tongue.text}\n 5: ${genderdropdown}\n 6: ${heightControlar.text}");
                  // await CreateAccount(first_name.text,sceond_name.text,nick_name.text,mother_tongue.text,heightControlar.text,genderdropdown).NewAccount(userId);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountScreen2(
                            userId: userId,
                            first_name: first_name,
                            sceond_name: sceond_name,
                            nick_name: nick_name,
                            mother_tongue: mother_tongue,
                            heightControlar: heightControlar,
                            genderValue: genderValue),
                      ));
                  print("primary Details Added");
                })
          ]).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('userId', userId));
  }
}
