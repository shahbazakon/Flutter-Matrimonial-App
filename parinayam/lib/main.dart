import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:parinayam/screens/about.dart';
import 'package:parinayam/screens/nochats.dart';
import 'package:parinayam/screens/setting_screen.dart';
import 'package:parinayam/screens/signin_screen.dart';
import 'package:parinayam/screens/splash_screen.dart';
import 'package:parinayam/screens/upload_photo_screen.dart';
import 'package:parinayam/utils/colors.dart';
import 'package:parinayam/utils/data_generator.dart';
import 'tabs/chat.dart';
import 'tabs/home.dart';
import 'tabs/matches.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: "Parinayama",
      debugShowCheckedModeBanner: false,
      home:  const DefaultTabController(
        length: 3,
        child: SplashScreen(),
            // SignInScreen(),
          // UploadPhotoScreen(),
        //   CreateAccountScreen(),
        // MyHomePage(title: "Parinayama"),                // home page
      ),
      routes: {"/about": (context) => const About()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  final userId;
  const MyHomePage({Key? key, required this.title,required this.userId}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(userId);
}

class _MyHomePageState extends State<MyHomePage> {

    final userId;
  _MyHomePageState(this.userId);


  Color currentColor = const Color.fromRGBO(255, 90, 96, 100);
  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    final _myTabPage = <Widget>[
      Home(userId: userId),
      const Matches(),
      const Chat(),
    ];

    final _myTabs = <Tab>[
      const Tab(text: 'HOME', icon: Icon(Icons.home_outlined)),
      const Tab(text: 'MATCHES', icon: Icon(Icons.group_outlined)),
      const Tab(text: 'CHAT', icon: Icon(Icons.mark_chat_unread_outlined))
    ];

    return DefaultTabController(
      length: _myTabs.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              widget.title,
              style: const TextStyle(fontSize: 22.0),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Parinayam Theme"),
                            content: SingleChildScrollView(
                              child: BlockPicker(
                                onColorChanged: changeColor,
                                pickerColor: currentColor,
                              ),
                            ),
                          );
                        });
                    // myThemeColor(currentColor); // <============================ need to set no primary color
                  },
                  color: useWhiteForeground(const Color.fromRGBO(255, 90, 96, 100))
                      ? Colors.black
                      : Colors.white,
                  icon: const Icon(Icons.color_lens_rounded)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoChatFound(),
                          fullscreenDialog: true),
                    );
                  },
                  icon: const Icon(Icons.notifications_outlined)),
              PopupMenuButton(itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Text("About"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const About()),
                        );
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Text("Settings"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()),
                        );
                      },
                    ),
                  ),
                  // const PopupMenuItem(child: Text("Option 3"))
                ];
              })
            ],
            bottom: TabBar(tabs: _myTabs)),
        body: TabBarView(children: _myTabPage),
      ),
    );
  }
}
