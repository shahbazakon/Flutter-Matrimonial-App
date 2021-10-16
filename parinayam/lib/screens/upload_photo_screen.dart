// import 'dart:html';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path/path.dart' as p;
import 'package:parinayam/utils/colors.dart';
import 'package:path_provider/path_provider.dart';
import '../main.dart';

class UploadPhotoScreen extends StatefulWidget {
  final userId;

  const UploadPhotoScreen({Key? key, @required this.userId}) : super(key: key);

  @override
  UploadPhotoScreenState createState() => UploadPhotoScreenState(userId);
}

class UploadPhotoScreenState extends State<UploadPhotoScreen> {
  final userId;
  UploadPhotoScreenState(this.userId);


  List<Asset> images = <Asset>[];

  List files = [];



  late List<Asset> resultList;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      error = error;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Parinayam',
          center: true, titleTextStyle: boldTextStyle(size: 25)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Upload your \nPhoto', style: boldTextStyle(size: 30)),
            16.height,
            Text('Add your best photos', style: primaryTextStyle()),
            16.height,
            images.isNotEmpty
                ? Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 16,
                    spacing: 16,
                    children: List.generate(
                      images.length,
                      (index) {
                        Asset asset = images[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AssetThumb(
                            asset: asset,
                            height: 200,
                            width: 155,
                          ),
                        );
                      },
                    ),
                  )
                : uploadImage(),
            16.height,
            AppButton(
              width: context.width(),
              color: primaryColor,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onTap: () async {
                // finish(context);
                var ImagePath1 = "${(await getTemporaryDirectory()).path}/${images[0].name}";
                var ImagePath2 = "${(await getTemporaryDirectory()).path}/${images[1].name}";
                var ImagePath3 = "${(await getTemporaryDirectory()).path}/${images[2].name}";
                var ImagePath4 = "${(await getTemporaryDirectory()).path}/${images[3].name}";
                print(
                    " Uploaded Image 1.1: ${images[0].name}, $ImagePath1"
                    "\n Uploaded Image 1.2: ${images[1].name}, $ImagePath2 "
                    "\n Uploaded Image 1.3: ${images[2].name}, $ImagePath3 "
                    "\n Uploaded Image 1.4: ${images[3].name}, $ImagePath4");

                // -----------------------------------------------------------------------------------------------------------------------------------------
                    try{
                  var data = FormData.fromMap(
                      {
                        "i1": await MultipartFile.fromFile(
                          ImagePath1,
                          filename: images[0].name,
                          // contentType: MediaType("image", images[0]!.path.split('.').last),
                        ),


                      });

                  Dio dio = Dio();
                  await dio
                      .post(
                      'https://matrimonial.kiska.co.in/api/v1/createimage/$userId',
                      data: data)
                      .then((response) => print(response))
                      .catchError((error) => print(error));
                }
                catch(e)
                {
                  print(e);
                }
                // ----------------------------------------------------------------------------------------------------------------------------------------

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(title: 'Parinayama', userId: userId)));
              },
              text: 'Continue',
              textStyle: boldTextStyle(color: white),
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }

  uploadImage() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: List.generate(
        4,
        (index) {
          return DottedBorderWidget(
            radius: 10,
            padding: EdgeInsets.zero,
            color: primaryColor,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor.withOpacity(0.2)),
              height: 200,
              width: context.width() * 0.5 - 24,
              child: IconButton(
                onPressed: () {
                  loadAssets();
                },
                icon: const Icon(Icons.add, color: primaryColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
