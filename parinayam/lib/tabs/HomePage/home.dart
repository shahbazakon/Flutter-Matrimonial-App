import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:parinayam/model/post_data.dart';
import 'package:parinayam/tabs/HomePage/profile.dart';
import 'package:parinayam/utils/colors.dart';
import 'plans_and_packages.dart';

class Home extends StatefulWidget {
  final userId;
  const Home({Key? key,@required this.userId}) : super(key: key);

  @override
  State<Home> createState() => _HomeState(userId);
}

class _HomeState extends State<Home> {
  var userId;
  _HomeState(this.userId);

  var proflieUrl = "https://kiska.co.in/app/api/v1/personaldetails/";
  var matcheUrl = "https://kiska.co.in/app/api/v1/matchprofile/1";
  var deshbordUrl = "https://kiska.co.in/app/api/v1/dashboard/1";
  var profileData, matcheData, dashbordData;

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    var profileRes = await Dio().get("$proflieUrl$userId");
    profileData = profileRes.data;
    var res = await Dio().get(matcheUrl);
    matcheData = res.data;
    var deshbordRes = await Dio().get(deshbordUrl);
    dashbordData = deshbordRes.data;
    setState(() {});
  }

  /*-----------------------------------------------------------------------------------------------------------------------*/
  /*======================================================== HOME PAGE ====================================================*/
  /*-----------------------------------------------------------------------------------------------------------------------*/
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileData != null
          ? Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SizedBox(
                    height: 170,
                    child: Stack(
                      children: [
                        ClipRRect(
                          child: profileData[0]["profile_img"]!=null ? Image.network(
                            profileData[0]["profile_img"],
                            fit: BoxFit.fitWidth,
                            height: 170,
                            width: 500,
                            colorBlendMode: BlendMode.darken,
                            color: Colors.black45,
                          ):
                          Image.asset("assets/noimagefound.jpg",fit: BoxFit.fitWidth,
                            height: 170,
                            width: 500,
                            colorBlendMode: BlendMode.darken,
                            color: Colors.black45,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Align(
                            alignment: const FractionalOffset(.7, 0),
                            child: Column(children: [
                              Text(
                                "${profileData[0]["first_name"]} ${profileData[0]["last_name"]}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "(${profileData[0]["nickname"]})",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 140,
                                child: RaisedButton(
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  // child: Icon(Icons.edit,color: Colors.white,),
                                  child: const Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile(userId : userId)),
                                    );
                                  },
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),

                  /*-----------------------------------------------------------------------------------------------------------------------*/
                  /*======================================================= LIKE CARDS ====================================================*/
                  /*-----------------------------------------------------------------------------------------------------------------------*/

                  Container(
                    // color: Colors.pink,
                    height: 250.0,
                    width: 500.0,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      padding: EdgeInsets.all(20.0),
                      children: [
                        Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  "${dashbordData["likes_you"]}",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: const Text(
                                  "Likes You",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                            )),
                        Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  "${dashbordData["you_likes"]}",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: const Text(
                                  "Your Likes",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                            )),
                        Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  "${dashbordData["ignore"]}",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: const Text(
                                  "Ignors",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                            )),
                        Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  "${dashbordData["viewed_you"]}",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: const Text(
                                  "Viewed You",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                            )),
                        Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.grey,
                                  )
                                ]),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  "${dashbordData["you_viewed"]}",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: const Text(
                                  "You Viewed",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                            )),
                        Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                  color: Colors.grey,
                                )
                              ]),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                "${dashbordData["shortlist"]}",
                                style: const TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              subtitle: const Text(
                                "Shortlist",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/referralAdd.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  /*-----------------------------------------------------------------------------------------------------------------------*/
                  /*====================================================== ONLINE MATCH ===================================================*/
                  /*-----------------------------------------------------------------------------------------------------------------------*/

                  const ListTile(
                    leading: Text(
                      "Online Match",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                          onPressed: (null),
                          child: Text(
                            "View All",
                          )),
                    ),
                  ),

                  /*--------------------------------------------------------------*/

                  Container(
                    child: matcheData != null
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 120.0,
                                  child: ListView.builder(
                                      itemCount: matcheData.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            height: 110.0,
                                            width: 110.0,
                                            margin: const EdgeInsets.all(4),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                matcheData[index]
                                                    ["profile_img"],
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          )),
                                )
                              ],
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Image.asset(
                        'assets/referralCard.png',
                      ),
                    ),
                  ),

                  const ListTile(
                    title: Text(
                      "Plans and Packages",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    subtitle: Text(
                      "choose your plan",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),

                  // -------------------------------------------------------------

                  const PlansAndPackages()

                  // -------------------------------------------------------------
                ]),
              ),
            )
          : const Center(child: RefreshProgressIndicator()),
    );
  }
}
