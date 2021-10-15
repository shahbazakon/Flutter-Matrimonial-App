import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PlansAndPackages extends StatefulWidget {
  const PlansAndPackages({Key? key}) : super(key: key);

  @override
  _PlansAndPackagesState createState() => _PlansAndPackagesState();
}

class _PlansAndPackagesState extends State<PlansAndPackages> {
  var subPlane = "https://matrimonial.kiska.co.in/app/api/v1/subsplan";
  var subPlaneData;


  @override
  void initState() {
    super.initState();
    fetchSubPlane();
  }

  fetchSubPlane() async {
    var subplaneResp = await Dio().get(subPlane);
    subPlaneData = subplaneResp.data;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: subPlaneData.length ?? 1,
        itemBuilder: (context, index) {
          dynamic dropdownValue = "${subPlaneData[index]["price"]}";
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    tileColor: const Color.fromRGBO(255, 190, 194, 100),
                    leading: Text(
                      "${subPlaneData[index]["name"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        const Align(
                          child: Text(
                            "Balance   |",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.black45, fontSize: 15.0),
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          width: 10,
                        ),
                        Text(
                          "${subPlaneData[index]["phone_call"]}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          width: 6,
                        ),
                        const Icon(
                          Icons.call_outlined,
                          color: Colors.blueAccent,
                          size: 19.0,
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          width: 10,
                        ),
                        Text(
                          "${subPlaneData[index]["message"]}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          width: 6,
                        ),
                        const Icon(
                          Icons.message_rounded,
                          color: Colors.green,
                          size: 19.0,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 8.0,
                              width: 8.0,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                              width: 6,
                            ),
                             Text(
                              "${subPlaneData[index]["description"]}",
                              style: const TextStyle(
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Container(
                            height: 8.0,
                            width: 8.0,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            width: 6,
                          ),
                           Text(
                            "${subPlaneData[index]["validity"]}",
                            style: const TextStyle(
                                fontSize: 19.0, fontWeight: FontWeight.w400),
                          )
                        ]),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            minWidth: 214.0,
                            height: 49.0,
                            child: OutlineButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                              ),
                              textColor: Colors.black,
                              disabledBorderColor:
                                  const Color.fromRGBO(255, 190, 194, 100),
                              child: Text(
                                "Buy Now".toUpperCase(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(255, 190, 194, 100),
                                  style: BorderStyle.solid,
                                  width: 1),
                              onPressed: () {},
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              border: Border.all(
                                  color: const Color.fromRGBO(255, 190, 194, 100),
                                  style: BorderStyle.solid,
                                  width: 0.80),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(8.0),
                                  value: dropdownValue,
                                  underline: null,
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    "${subPlaneData[index]["price"]}",
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text("Rs.$value",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ]),
              ),
            )
          ]);
        });
  }
}
