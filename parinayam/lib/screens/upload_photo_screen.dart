import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/utils/colors.dart';
import '../main.dart';
import 'ideal_screen.dart';


class UploadPhotoScreen extends StatefulWidget {
  final userId;
  const UploadPhotoScreen({Key? key,@required this.userId}) : super(key: key);

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
      appBar: appBarWidget('Parinayam', center: true, titleTextStyle: boldTextStyle(size: 25)),
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
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onTap: () {
                // finish(context);
                print(" Uploaded Image 1.1: ${images[0]} "
                    "\n Uploaded Image 1.2:  ${images[1]} "
                    "\n Uploaded Image 1.3: ${images[2]} "
                    "\n Uploaded Image 1.4: ${images[3]}");
                // const IdealScreen().launch(context);
                try {
                  var formData = {
                    'i1': images[0],
                    'i2': images[1],
                    'i3': images[2],
                    'i4': images[3],
                  };
                  var res = Dio()
                      .post('https://kiska.co.in/app/api/v1/createimage/$userId',
                      data: formData)
                      .then((response) {
                    response.statusCode == 200
                        ? print("successful Image Uploaded")
                        : print("fail");
                  });
                } on DioError catch (e) {
                  if (e.response != null) {
                    print(e.message);
                    print(e.response!.data);
                    print(e.response!.headers);
                    print(e.response);
                  } else {
                    print("fail");
                    print(e.message);
                  }
                }


                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Parinayama',userId: userId)));


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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor.withOpacity(0.2)),
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
