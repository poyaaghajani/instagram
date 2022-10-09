import 'package:flutter/material.dart';
import 'package:instagram_ui/Screens/switch_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

  @override
  void initState() {
    super.initState();
    email.addListener(() {
      setState(() {});
    });
    password.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              _getRocketColumn(),
              _getSingUpColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRocketColumn() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 40,
        child: Column(
          children: [
            Expanded(
              child: Image.asset('images/rocket.png'),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSingUpColumn() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Color(0xff1C1F2E),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sing in to',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GB',
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5),
                      Image.asset('images/mood.png')
                    ],
                  ),
                  SizedBox(height: 34),
                  Container(
                    height: 46,
                    width: 340,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      focusNode: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xff323A99),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color:
                              email.hasFocus ? Color(0xffF35383) : Colors.white,
                          fontFamily: 'GM',
                          fontSize: 15,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xffC5C5C5),
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xffF35383),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    height: 46,
                    width: 340,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      focusNode: password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color(0xff323A99),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: password.hasFocus
                              ? Color(0xffF35383)
                              : Colors.white,
                          fontFamily: 'GM',
                          fontSize: 15,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xffC5C5C5),
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xffF35383),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 46,
                    width: 129,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SwitchAccountScreen(),
                          ),
                        );
                      },
                      child: Text('Sing in'),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? / ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'GB',
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Sing up',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'GB',
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
}
