import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:parinayam/tabs/fullprofile.dart';


class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  var matcheUrl = "https://kiska.co.in/app/api/v1/matchprofile/1";
  var matcheData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await Dio().get(matcheUrl);
    matcheData = res.data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: matcheData != null
          ? SizedBox(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: (30.0 / 40.0)),
                itemBuilder: (context, index) {
                  var ProfileId = matcheData[index];
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Hero(
                                tag: ProfileId,
                                child: Image.network(
                                  ProfileId["profile_img"],
                                  height: 130,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${matcheData[index]["first_name"]} ${matcheData[index]["last_name"]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      Container(height: 3),
                                      Expanded(
                                        child: Text(
                                            "${matcheData[index]["work_domain"]} | ${matcheData[index]["religion"]}, ${matcheData[index]["caste"]} | ${matcheData[index]["height"]}'' | ${matcheData[index]["salary"]} | ${matcheData[index]["location"]}",
                                            textAlign: TextAlign.justify
                                            ,style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 12)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(height: 5)
                            ],
                          ),
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FullProfile(ProfileId: ProfileId)));
                        }),
                  );
                },
                itemCount: matcheData.length,
              ),
            )
          : const Center(child: RefreshProgressIndicator()),
    );
  }
}
