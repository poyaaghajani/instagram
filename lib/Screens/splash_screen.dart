import 'package:flutter/material.dart';
import 'package:instagram_ui/Screens/login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goNextScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1C1F2E),
        image: DecorationImage(
          image: AssetImage('images/pattern1.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Image.asset(
                'images/logo_splash.png',
                width: 170,
                height: 77,
              ),
            ),
            Positioned(
              bottom: 190,
              child: SpinKitCircle(
                color: Colors.white,
                size: 45,
              ),
            ),
            Positioned(
              bottom: 20,
              child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 18,
                      fontFamily: 'GB',
                    ),
                  ),
                  Text(
                    'ExpertFlutter',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 16,
                      fontFamily: 'GB',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

goNextScreen(context) {
  var duration = Duration(seconds: 5);
  Future.delayed(duration, () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  });
}
