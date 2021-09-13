import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/utils/colors.dart';
import 'create_account_screen.dart';
import 'signin_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Parinayam', style: boldTextStyle(size: 35)).center().expand(),
            42.height,
            Text('Find Your \n Perfect Match', style: boldTextStyle(size: 25), textAlign: TextAlign.center),
            16.height,
            Text('Sign in and find your couple now!', style: primaryTextStyle()),
            32.height,
            Container(
              width: context.width(),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(12)),
              child: Text('Do you already have an account?', style: boldTextStyle(), textAlign: TextAlign.center),
            ).onTap((){
              finish(context);
              const CreateAccountScreen().launch(context);
            },highlightColor: white, splashColor: white),
            8.height,
            AppButton(
              text: 'Get Started',
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              textStyle: boldTextStyle(color: white),
              width: context.width(),
              color: primaryColor,
              onTap: () {
                finish(context);
                const SignInScreen().launch(context);
              },
            ).paddingOnly(left: 16, right: 16,bottom: 16)
          ],
        ),
      ),
    );
  }
}
