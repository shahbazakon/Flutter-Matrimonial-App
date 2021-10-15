import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class FullProfile extends StatefulWidget {
  final ProfileId;

  const FullProfile({Key? key, this.ProfileId}) : super(key: key);

  @override
  FullProfileState createState() => FullProfileState(ProfileId);
}

class FullProfileState extends State<FullProfile> {
  final ProfileId;

  FullProfileState(this.ProfileId);

  int page = 0;
  static const MAX = 4;
  var fullProfileAPI = "https://matrimonial.kiska.co.in/app/api/v1/fullprofile/1";
  var fullProfileData;
  bool isVisible = false;
  var changeText = "Show More";

  @override
  void initState() {
    super.initState();
    fetchFullProfile();
  }

  fetchFullProfile() async {
    var fullProfileResp = await Dio().get(fullProfileAPI);
    fullProfileData = fullProfileResp.data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.share_rounded,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ),
        elevation: 0.0,
      ),
      body: fullProfileData != null
          ? SingleChildScrollView(
              child: ProfileId["ID"] == fullProfileData[0]["ID"]
                  ? Column(children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        elevation: 2,
                        margin: const EdgeInsets.all(0),
                        child: SizedBox(
                          height: 450,
                          child: Stack(
                            children: <Widget>[
                              PageView(
                                children: <Widget>[
                                  Hero(
                                    tag: fullProfileData[0]["ID"],
                                    child: Image.network(
                                        fullProfileData[0]["profile_img"],
                                        fit: BoxFit.fitWidth),
                                  ),
                                  Image.network(fullProfileData[0]["url_1"],
                                      fit: BoxFit.fitWidth),
                                  Image.network(fullProfileData[0]["url_2"],
                                      fit: BoxFit.fitWidth),
                                  Image.network(fullProfileData[0]["url_3"],
                                      fit: BoxFit.fitWidth),
                                ],
                                onPageChanged: onPageViewChange,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                        Colors.black.withOpacity(0.0),
                                        Colors.black.withOpacity(1.0)
                                      ])),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "${ProfileId["first_name"]} ${ProfileId["last_name"]}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 6, bottom: 0),
                                    child: Text(
                                      "${ProfileId["work_domain"]}  |  ${ProfileId["religion"]}, ${ProfileId["caste"]}  | ${ProfileId["DOB"]} |  ${ProfileId["height"]}  |  ${ProfileId["salary"]}  |  ${ProfileId["location"]}",
                                      // textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 12),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: buildDots(context),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 3,
                        margin: const EdgeInsets.fromLTRB(10, 15, 10, 8),
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            child: ListTile(
                              title: Text(
                                "About ${fullProfileData[0]["first_name"]} ${fullProfileData[0]["last_name"]}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
    "${fullProfileData[0]["bio"]}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            )),
                      ),

                      //------------------------------------------------------------------------------
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                                // elevation: 1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                textColor: Colors.grey,
                                color: Colors.white70,
                                child: Text(changeText.toUpperCase()),
                                onPressed: () => setState(() {
                                      isVisible = !isVisible;
                                      changeText == 'Show More'
                                          ? changeText = 'Hide'
                                          : changeText = 'Show More';
                                    })),
                          ),
                        ],
                      ),

                      Visibility(
                        visible: isVisible,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 10, 0, 10),
                            child: Text(
                              "personal details".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: isVisible,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 275,
                          width: 600,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black12)),
                          child: GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: (20.0 / 10.0),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              padding: const EdgeInsets.all(10),
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Colors.grey,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: const [
                                      Positioned(
                                        left: 80,
                                        top: 5,
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromRGBO(
                                              144, 231, 137, 200),
                                          radius: 50.0,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              /*"${fullProfileData[0][""]}"*/ "--",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.calendar_today_rounded,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  ),
                                ),

                                Visibility(
                                  visible: isVisible,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.grey,
                                              offset: Offset(0, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          left: 80,
                                          top: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Color.fromRGBO(
                                                212, 128, 224, 200),
                                            radius: 50.0,
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "${fullProfileData[0]["height"]} ft",
                                                style: const TextStyle(fontSize: 17),
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.height_rounded,
                                                size: 30,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: isVisible,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.grey,
                                              offset: Offset(0, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          left: 80,
                                          top: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Color.fromRGBO(
                                                114, 175, 231, 190),
                                            radius: 50.0,
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "${fullProfileData[0]["body_shape"]}",
                                                style: const TextStyle(fontSize: 17),
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.fitness_center_rounded,
                                                size: 30,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: isVisible,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.grey,
                                              offset: Offset(0, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          left: 80,
                                          top: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Color.fromRGBO(
                                                119, 231, 220, 170),
                                            radius: 50.0,
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "${fullProfileData[0]["mother_tongue"]}",
                                                style: const TextStyle(fontSize: 17),
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.translate_rounded,
                                                size: 30,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: isVisible,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.grey,
                                              offset: Offset(0, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          left: 80,
                                          top: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Color.fromRGBO(
                                                250, 233, 157, 150),
                                            radius: 50.0,
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  10, 10, 80, 10),
                                              child: Text(
                                                "${fullProfileData[0]["martial_status"]}",
                                                style: const TextStyle(fontSize: 17),
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.group_outlined,
                                                size: 30,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: isVisible,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.grey,
                                              offset: Offset(0, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          left: 80,
                                          top: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Color.fromRGBO(
                                                238, 161, 134, 200),
                                            radius: 50.0,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "${fullProfileData[0]["blood_group"]}"
                                                  .toUpperCase(),
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.bloodtype_outlined,
                                                size: 30,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // ---------------------------------------------------
                              ]),
                        ),
                      ),

                      Visibility(
                        visible: isVisible,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                            child: Text(
                              "habbits".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: isVisible,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: ListTile.divideTiles(
                            context: context,
                            tiles: [
                              ListTile(
                                leading: const Text(
                                  "Food habits",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["food_habits"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                  leading: const Text(
                                    "Drinking",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  title: fullProfileData[0]["drinking"] == 0
                                      ? const Align(
    alignment: Alignment.centerRight,
                                        child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.red,
                                          ),
                                      )
                                      : const Align(
                                    alignment: Alignment.centerRight,
                                        child: Icon(
                                            Icons.check_rounded,
                                            color: Colors.green,
                                          ),
                                      )),
                              ListTile(
                                  leading: const Text(
                                    "Smoking",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  title: fullProfileData[0]["smoking"] == 0
                                      ? const Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.red,
                                          ))
                                      : const Align(
                                    alignment: Alignment.centerRight,
                                        child: Icon(
                                            Icons.check_rounded,
                                            color: Colors.green,
                                          ),
                                      ))
                            ],
                          ).toList(),
                        ),
                      ),

                      Visibility(
                        visible: isVisible,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                            child: Text(
                              "my religious belief".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: isVisible,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: ListTile.divideTiles(
                            context: context,
                            tiles: [
                              ListTile(
                                leading: const Text(
                                  "Religion",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["religion"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Caste",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["caste"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Gothram",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["gothram"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Maternal Gothram",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["maternal_gothram"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Dosham",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["dosham"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "DOB",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["DOB"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Place of Birth",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["POB"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Star",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["star"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "${fullProfileData[0]["raasi"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                                leading: const Text(
                                  "Raasi",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ).toList(),
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 10, 0, 10),
                            child: Text(
                              "education & career".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 275,
                          width: 600,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black12)),
                          child: GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: (20.0 / 10.0),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              padding: const EdgeInsets.all(10),
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Colors.grey,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        left: 90,
                                        bottom: 0,
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromRGBO(
                                              144, 231, 137, 200),
                                          radius: 50.0,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 40, 10),
                                            child: Text(
                                              "${fullProfileData[0]["highest_qualification"]}",
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.school_outlined,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Colors.grey,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        left: 90,
                                        bottom: 0,
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromRGBO(
                                              212, 128, 224, 200),
                                          radius: 50.0,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 40, 10),
                                            child: Text(
                                              "${fullProfileData[0]["work_domain"]}",
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.height_rounded,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Colors.grey,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        left: 90,
                                        bottom: 0,
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromRGBO(
                                              114, 175, 231, 190),
                                          radius: 50.0,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 40, 10),
                                            child: Text(
                                              "${fullProfileData[0]["designation"]}",
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.work_outline,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Colors.grey,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        left: 90,
                                        bottom: 0,
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromRGBO(
                                              119, 231, 220, 170),
                                          radius: 50.0,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            child: Text(
                                              "${fullProfileData[0]["organization_name"]}",
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 40, 10),
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.home_work_outlined,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Colors.grey,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        left: 90,
                                        bottom: 0,
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromRGBO(
                                              250, 233, 157, 150),
                                          radius: 50.0,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 50, 10),
                                            child: Text(
                                              "${fullProfileData[0]["salary"]} LPA",
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons
                                                  .account_balance_wallet_outlined,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),

                      Visibility(
                        visible: isVisible,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                            child: Text(
                              "my family".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: isVisible,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: ListTile.divideTiles(
                            context: context,
                            tiles: [
                              ListTile(
                                leading: const Text(
                                  "Family Status",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["family_status"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Father Name",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["father_name"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Occupation",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["fat_occupation"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),ListTile(
                                leading: const Text(
                                  "Mother Name",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["mother_name"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Occupation",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["mom_occupation"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Family Current Location",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["fam_curr_loc"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Place-ancestral/Native Place",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${fullProfileData[0]["native_place"]}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const ListTile(
                                leading: Text(
                                  "No. of Brothers",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  /*"${fullProfileData[0][""]}"*/ "--",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const ListTile(
                                leading: Text(
                                  "No. of Sisters",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  /*"${fullProfileData[0][""]}"*/ "--",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const ListTile(
                                leading: Text(
                                  "name of brothers",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  /*"${fullProfileData[0][""]}"*/ "--",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const ListTile(
                                leading: Text(
                                  "name of sisters",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  /*"${fullProfileData[0][""]}"*/ "--",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ).toList(),
                        ),
                      ),

                      //------------------------------------------------------------------------------
                      const Divider(color: Colors.grey),

                      SizedBox(
                        // color: Colors.pink,
                        height: 85.0,
                        width: 400.0,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 5,
                          padding: const EdgeInsets.all(4.0),
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 4,
                                          color: Colors.grey,
                                        )
                                      ]),
                                  child: const IconButton(
                                    icon: Icon(
                                      Icons.thumb_up_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Like",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 4,
                                          color: Colors.grey,
                                        )
                                      ]),
                                  child: const IconButton(
                                    icon: Icon(
                                      Icons.chat_outlined,
                                      color: Colors.black,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Chat",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 4,
                                          color: Colors.grey,
                                        )
                                      ]),
                                  child: const IconButton(
                                    icon: Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Shortlist",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 4,
                                          color: Colors.grey,
                                        )
                                      ]),
                                  child: const IconButton(
                                    icon: Icon(
                                      Icons.call_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Call",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 4,
                                          color: Colors.grey,
                                        )
                                      ]),
                                  child: const IconButton(
                                    icon: Icon(
                                      Icons.thumb_down_alt_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Ignore",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ])
                  : const Center(child: RefreshProgressIndicator()),
            )
          : const Center(child: RefreshProgressIndicator()),
    );
  }

  void onPageViewChange(int _page) {
    page = _page;
    setState(() {});
  }

  Widget buildDots(BuildContext context) {
    Widget widget;

    List<Widget> dots = [];
    for (int i = 0; i < MAX; i++) {
      Widget w = Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 8,
        width: 8,
        child: CircleAvatar(
          backgroundColor: page == i ? Colors.blue : Colors.grey[100],
        ),
      );
      dots.add(w);
    }
    widget = Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
    return widget;
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('ProfileId', ProfileId));
    properties.add(DiagnosticsProperty('ProfileId', ProfileId));
    properties.add(DiagnosticsProperty('ProfileId', ProfileId));
    properties.add(DiagnosticsProperty('ProfileId', ProfileId));
    properties.add(DiagnosticsProperty('fullProfileData', fullProfileData));
  }
}
