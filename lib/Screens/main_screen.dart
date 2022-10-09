import 'package:flutter/material.dart';
import 'package:instagram_ui/Screens/activity_screen.dart';
import 'package:instagram_ui/Screens/home_screen.dart';
import 'package:instagram_ui/Screens/post_screen.dart';
import 'package:instagram_ui/Screens/profile_screen.dart';
import 'package:instagram_ui/Screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selecktedBottomNavigationBarr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff1C1F2E),
            onTap: (int index) {
              setState(() {
                _selecktedBottomNavigationBarr = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selecktedBottomNavigationBarr,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                activeIcon: Image.asset('images/icon_active_home.png'),
                label: 'item',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_search_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_search_navigation_active.png'),
                label: 'item',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_add_navigation_active.png'),
                label: 'item',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_activity_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_activity_navigation_active.png'),
                label: 'item',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                activeIcon: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF35383),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                label: 'item',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selecktedBottomNavigationBarr,
        children: _getLayout(),
      ),
    );
  }

  List<Widget> _getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      PostScreen(),
      ActivityScreen(),
      ProfileScren(),
    ];
  }
}
