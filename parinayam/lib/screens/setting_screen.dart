import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/model/parinayam_model.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/data_generator.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  List<ParinayamModel> list = getSettingData();

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
    return Scaffold(
      appBar: appBarWidget('Setting',
          center: true, titleTextStyle: boldTextStyle(size: 25)),
      body: Column(
        children: [
          16.height,
          ...list.map(
            (e) {
              return Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black12)),
                width: context.width(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.name!, style: boldTextStyle()),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ).onTap(() {
                e.widget != null
                    ? Navigator.push(
                        context, MaterialPageRoute(builder: (_) => e.widget!))
                    : const SizedBox();
              }, splashColor: white, highlightColor: white);
            },
          ).toList(),
          16.height,
          AppButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Logout',
                    style: boldTextStyle(color: white),
                    textAlign: TextAlign.center),
                const Icon(Icons.logout, color: white),
              ],
            ),
            width: context.width(),
            color: primaryColor,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onTap: () {
              showConfirmDialog(context, 'Do you want to logout from the app?');
            },
          ),
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
