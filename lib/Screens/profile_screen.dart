import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_ui/Constants/constants.dart';
import 'package:instagram_ui/Screens/massage_screen.dart';

class ProfileScren extends StatelessWidget {
  const ProfileScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 40,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 18, top: 18),
                    child: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: Color(0xff1C1F2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Color(0xff1C1F2E),
                expandedHeight: 173,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/header.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getProfileHeader(context),
              ),
              SliverToBoxAdapter(
                child: _getHighlights(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDeligate(
                  TabBar(
                    indicatorWeight: 2,
                    indicatorPadding: EdgeInsets.symmetric(vertical: 5),
                    indicatorColor: Color(0xffF35383),
                    tabs: [
                      Tab(
                        icon: Image.asset('images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 16, left: 5, right: 5),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset('images/profile$index.png'),
                                  ),
                                ),
                              ),
                          childCount: 6),
                      gridDelegate: SliverQuiltedGridDelegate(
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 70),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (contex, index) {
                          return Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                height: 350,
                                width: 370,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Container(
                                      child:
                                          Image.asset('images/video$index.png'),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 35,
                                right: 30,
                                child: Image.asset(
                                  'images/icon_video.png',
                                ),
                              ),
                            ],
                          );
                        },
                        childCount: 4,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getProfileHeader(context) {
    return Container(
      color: Color(0xff1C1F2E),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                Container(
                  height: 66,
                  width: 66,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF35383),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
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
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Poya Aghajani',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GB',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '_poya.3',
                      style: TextStyle(
                        color: Color(0xffC5C5C5),
                        fontFamily: 'GB',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Image.asset('images/icon_profile_edit.png'),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: double.infinity),
                Text(
                  'Programming is a skill...!',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 15,
                  ),
                ),
                Text(
                  'My website',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.link,
                  color: Color(0xffC5C5C5),
                  size: 18,
                ),
              ),
              Text(
                'yek.link/wwwPoya.com',
                style: TextStyle(
                  color: Colors.cyan,
                  fontFamily: 'GB',
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(
                  Icons.rocket_launch_outlined,
                  color: Color(0xffC5C5C5),
                  size: 21,
                ),
                SizedBox(width: 5),
                Text(
                  'Developer',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.location_on_outlined,
                  color: Color(0xffC5C5C5),
                  size: 21,
                ),
                SizedBox(width: 5),
                Text(
                  'Guilan',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  '6',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GB',
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'post',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '11.2K',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GB',
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'followers',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '330',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GB',
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'following',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _getFollowRow(context),
        ],
      ),
    );
  }
}

Widget _getFollowRow(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(150, 40),
        ),
        onPressed: () {},
        child: Text('Follow'),
      ),
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: BorderSide(width: 2, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          minimumSize: Size(150, 40),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => MassageScreen()),
            ),
          );
        },
        child: Text(
          'Massage',
          style: TextStyle(
            fontFamily: 'GB',
            fontSize: 15,
          ),
        ),
      ),
    ],
  );
}

Widget _getHighlights() {
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Container(
                          child: Image.asset('images/highlight$index.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  getClassList()[4].highlight![index],
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Colors.white,
                  ),
                ),
              ],
            );
          }),
    ),
  );
}

class TabBarViewDeligate extends SliverPersistentHeaderDelegate {
  TabBarViewDeligate(this._tabBar);
  final TabBar _tabBar;

  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
