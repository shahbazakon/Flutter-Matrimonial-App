import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/model/parinayam_model.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/data_generator.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  List<ParinayamModel> list = getNotificationList();

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
      appBar: appBarWidget(
        'Notifications',
        center: true,
        titleTextStyle: boldTextStyle(size: 20),
      ),
      body: Column(
        children: [
          16.height,
          ...list.map(
            (e) {
              return InkWell(
                splashColor: white,
                highlightColor: white,
                onTap: () {
                  e.mISCheck = !e.mISCheck!;
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: grey)),
                  width: context.width(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.name!, style: boldTextStyle()),
                      Switch(
                          activeColor: primaryColor,
                          value: e.mISCheck!,
                          onChanged: (val) {
                            e.mISCheck = !e.mISCheck!;
                            setState(() {});
                          })
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
