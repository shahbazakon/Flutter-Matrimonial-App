import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parinayam/tabs/Chats/chat_screen.dart';
import 'package:parinayam/screens/nochats.dart';


class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var demoAPI = "https://kiska.co.in/app/api/v1/matchprofile/1/";
  var chatData;

  @override
  void initState() {
    super.initState();
    fetchchats();
  }

  fetchchats() async {
    var chatresp = await Dio().get(demoAPI);
    chatData = chatresp.data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: chatData != null
            ? ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Colors.grey,
                          )
                        ]),
                    child: ListTile(
                        contentPadding: EdgeInsets.all(4.0),
                        leading: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage(
                            chatData[index]["profile_img"] ??
                                "assets/noimagefound.jpg",
                          ),
                        ),
                        title: Text(
                          "${chatData[index]["first_name"]} ${chatData[index]["last_name"]}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "${chatData[index]["location"]}",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(),
                            ),
                          );
                        }),
                  );
                })
            : nochatfound(),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('chatData', chatData));
    properties.add(DiagnosticsProperty('chatData', chatData));
  }
}
