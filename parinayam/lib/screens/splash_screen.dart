import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'walk_through_screen.dart';
// import 'package:prokit_flutter/fullApps/dating/screen/walk_through_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) finish(context);
    const WalkThroughScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: const Text(
              "Welcome to",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/Logo.png',
              height: 125,
            ),
          ),
          const Text(
            "Parinayam",
            style: TextStyle(
              color: Colors.black,
              fontSize: 37,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            'assets/couples.png',
            alignment: Alignment.bottomCenter,
            // height: 540,                       // Height Error
          )
        ],
      ),
    );
  }
}
