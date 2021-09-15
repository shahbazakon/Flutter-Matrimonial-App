import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/model/post_data.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';
import 'create_account_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passWordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Welcome \nback!', style: boldTextStyle(size: 30)),
              16.height,
              Text('Glad to see you again!', style: primaryTextStyle()),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(color: black),
                focus: emailFocus,
                nextFocus: passWordFocus,
                textFieldType: TextFieldType.EMAIL,
                cursorColor: primaryColor,
                controller: emailController..text='abc@gmail.com',
                decoration: buildInputDecoration('Email','Email',
                    prefixIcon:
                        const Icon(Icons.email_rounded, color: primaryColor)),
              ),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(color: black),
                textFieldType: TextFieldType.PHONE,
                cursorColor: primaryColor,
                controller: phoneController..text="1234567890",
                decoration: buildInputDecoration('Phone','Phone',
                    prefixIcon:
                        const Icon(Icons.call_rounded, color: primaryColor)),
              ),
              16.height,
              AppButton(
                width: context.width(),
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: primaryColor,
                onTap: () async {
                  print("SingIn Up");
                  var userId = await PostData(emailController,phoneController).SignIndata();
                  print("Singin Screen ${userId}");
                  // finish(context);
                  // const CreateAccountScreen(userId: userId).launch(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen(userId : userId)));
                  print("SingIn Done");
                },
                text: 'Sign In',
                textStyle: boldTextStyle(color: white),
              ),
            ]
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
