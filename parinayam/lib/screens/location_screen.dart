import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/widgets.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
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
        'Change your location',
        center: true,
        titleTextStyle: boldTextStyle(size: 20),
        actions: [
          const Icon(Icons.location_on_outlined).paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Stack(
              alignment: Alignment.center,
              children: [
                commonCachedNetworkImage(
                  'assets/mapImg.jpg',
                  fit: BoxFit.cover,
                  height: context.height() * 0.25,
                  width: context.width(),
                ).cornerRadiusWithClipRRect(20),
                Container(
                  height: context.height() * 0.25,
                  width: context.width(),
                  color: grey.withOpacity(0.6),
                ).cornerRadiusWithClipRRect(20),
                Text('Do you want us to use GPS?', style: boldTextStyle(color: white, size: 20), textAlign: TextAlign.center)
              ],
            ),
            16.height,
            AppButton(
              width: context.width(),
              color: primaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onTap: () {
                //
              },
              text: 'Use my location',
              textStyle: boldTextStyle(color: white),
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
