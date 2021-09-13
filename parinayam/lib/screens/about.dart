import 'package:flutter/material.dart';
import 'package:parinayam/utils/colors.dart';
import 'setting_screen.dart';


class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("About"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {Navigator.pop(context);},
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String value){},
              itemBuilder: (context) => [
                PopupMenuItem(child: ListTile(
                  leading: const Text("Settings",),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingScreen()),
                    );
                  },
                ),
                ),
              ],
            )
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 10),
            Card(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(2),),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.white,
              elevation: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/Logo.png'),
                          backgroundColor: primaryColor,
                          radius: 30.0,
                        ),
                        Container(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Parinayam About", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                            Container(height: 2),
                            const Text("@parinayam",style: TextStyle(color: Color.fromRGBO(100, 100, 100, 100)),)
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: <Widget>[
                        const SizedBox(child: Icon(Icons.info, color: Colors.black54), width: 50),
                        Container(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Version", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
                            Container(height: 2),
                            const Text("1.0.0",style: TextStyle(color: Colors.black45), )
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: <Widget>[
                        const SizedBox(child: Icon(Icons.sync, color: Colors.black54), width: 50),
                        Container(width: 15),
                        const Text("Changelog", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
                        const Spacer(),
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: <Widget>[
                        const SizedBox(child: Icon(Icons.book, color: Colors.black54), width: 50),
                        Container(width: 15),
                        const Text("License", style: TextStyle(color: Colors.black87)),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(2),),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.white,
              elevation: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(width: 6),
                        const Text("Author", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: <Widget>[
                        const SizedBox(child: Icon(Icons.person, color: Colors.black54), width: 50),
                        Container(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Author Name", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
                            Container(height: 2),
                            const Text("India", style: TextStyle(color: Colors.grey))
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: <Widget>[
                        const SizedBox(child: Icon(Icons.file_download, color: Colors.black54), width: 50),
                        Container(width: 15),
                        const Text("Download From Cloud", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(2),),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.white,
              elevation: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(width: 6),
                        const Text("Company", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: <Widget>[
                        const SizedBox(child: Icon(Icons.business, color: Colors.black54), width: 50),
                        Container(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Vgeekers", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
                            Container(height: 2),
                            const Text("Android App Specialist", style: TextStyle(color: Colors.grey))
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: <Widget>[
                        const SizedBox(child: Icon(Icons.location_on, color: Colors.black54), width: 50),
                        Container(width: 15),
                        const Expanded(
                          child: Text("Sector 64, Greater Noida, India", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(height: 10),
          ],
        ),
      ),
    );
  }
}

