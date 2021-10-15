import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:parinayam/model/parinayam_model.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/data_generator.dart';

import 'personal_detail.dart';
import 'profile_details.dart';

class EditProfile extends StatefulWidget {
  final userId;
  const EditProfile({Key? key,@required this.userId}) : super(key: key);

  @override
  Profile createState() => Profile(userId);
}

class Profile extends State<EditProfile> {

  var userId;
  Profile(this.userId);

  var proflieUrl = "https://matrimonial.kiska.co.in/app/api/v1/personaldetails/";
  var matcheUrl = "https://kiska.co.in/app/api/v1/matchprofile/1";
  var profileData, matcheData;

  @override
  void initState() {
    super.initState();
    getProfileData();
    init();
  }

  getProfileData() async {
    var profileRes = await Dio().get("$proflieUrl$userId");
    profileData = profileRes.data;

    var res = await Dio().get(matcheUrl);
    matcheData = res.data;
    setState(() {});
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

  List<ParinayamModel> list = getEditDetails(userId);

  return  Scaffold(
        body: profileData != null
            ?  NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  backgroundColor: primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: /*Image.network(profileData[0]["profile_img"]*/Image.asset("assets/noimagefound.jpg",
                        fit: BoxFit.cover, colorBlendMode: BlendMode.darken),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Container(
                      transform: Matrix4.translationValues(0, 50, 0),
                      child: profileData[0]["profile_img"] !=null ?  CircleAvatar(
                        backgroundColor: Colors.white70,
                        backgroundImage: NetworkImage(profileData[0]["profile_img"]),
                        radius: 50.0,
                      ):
                      const CircleAvatar(
                        backgroundColor: Colors.white70,
                        backgroundImage: AssetImage("assets/noimagefound.jpg"),
                        radius: 50.0,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 00),
                child: Column(
                  children: <Widget>[
                    Container(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${profileData[0]["first_name"]} ${profileData[0]["last_name"]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: const Icon(
                              Icons.edit_rounded,
                              size: 18,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfileDetails()),
                              );
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 265,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "This is the Temporary Demo Bio",
                            // profileData[0]["bio"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[900], fontSize: 15),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(
                              Icons.edit_rounded,
                              size: 18,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalDetails()),
                              );
                            }),
                      ],
                    ),
                    20.height,
                    const Divider(color: Colors.grey),
                    const ListTile(
                      leading: Text(
                        "Your Picture",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              icon: Icon(
                                Icons.edit_rounded,
                                size: 18,
                                color: primaryColor,
                              ),
                              onPressed: null)),
                    ),
                    Container(
                      child: matcheData != null
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 120.0,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          height: 110.0,
                                          width: 110.0,
                                          margin: const EdgeInsets.all(4),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: profileData[0]["url_1"] != null ? Image.network(
                                              profileData[0]["url_1"],
                                              fit: BoxFit.fitWidth,
                                            ):
                                            Image.asset("assets/noimagefound.jpg",fit: BoxFit.fitWidth,),
                                          ),
                                        ),
                                        Container(
                                          height: 110.0,
                                          width: 110.0,
                                          margin: const EdgeInsets.all(4),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: profileData[0]["url_2"]!=null? Image.network(
                                              profileData[0]["url_2"],
                                              fit: BoxFit.fitWidth,
                                            ):
                                            Image.asset("assets/noimagefound.jpg",fit: BoxFit.fitWidth,),
                                          ),
                                        ),
                                        Container(
                                          height: 110.0,
                                          width: 110.0,
                                          margin: const EdgeInsets.all(4),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: profileData[0]["url_3"]!=null? Image.network(
                                              profileData[0]["url_3"],
                                              fit: BoxFit.fitWidth,
                                            ):
                                            Image.asset("assets/noimagefound.jpg",fit: BoxFit.fitWidth,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                    const Divider(color: Colors.grey),
                    Column(
                      children: [
                        16.height,
                        ...list.map(
                          (e) {
                            return Container(
                              margin: const EdgeInsets.only(top: 7, bottom: 7),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black12)),
                              width: context.width(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e.name!, style: boldTextStyle()),
                                  const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ).onTap(() {
                              e.widget != null
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => e.widget!))
                                  : const SizedBox();
                            }, splashColor: white, highlightColor: white);
                          },
                        ).toList(),
                      ],
                    ).paddingOnly(left: 10, right: 10),
                  ],
                ),
              ),
            ),
          ): const Center(child: RefreshProgressIndicator())
    );
  }
}
