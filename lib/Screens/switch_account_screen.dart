import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_ui/Screens/main_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/switch_account_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3,
                        sigmaY: 3,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ]),
                        ),
                        width: 340,
                        height: 352,
                        child: Column(
                          children: [
                            SizedBox(height: 32),
                            Container(
                              height: 120,
                              width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Container(
                                      child: Image.asset('images/poya.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Poya Aghajani',
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 129,
                              height: 46,
                              child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MainScreen();
                                      },
                                    ),
                                  );
                                },
                                child: Text('Confirm'),
                              ),
                            ),
                            SizedBox(height: 32),
                            Text('Switch Account',
                                style: Theme.of(context).textTheme.headline4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 163, bottom: 63),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account? /',
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey, fontFamily: 'GB'),
                ),
                Text(
                  'sign up',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: 'GB'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
