import 'package:flutter/material.dart';
import 'package:instagram_ui/Constants/constants.dart';
import 'package:instagram_ui/Model/Enums/activity_cases.dart';
import 'package:instagram_ui/Screens/massage_screen.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: Color(0xff1C1F2E),
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 18, fontFamily: 'GB'),
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                indicatorColor: Color(0xffF35383),
                tabs: [
                  Tab(
                    text: 'following',
                  ),
                  Tab(
                    text: 'you',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getFollowers(index);
                          },
                          childCount: 15,
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Text(
                            'New',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'GB',
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getFollowingRow(
                                index, ActivityStatus.following);
                          },
                          childCount: 2,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'GB',
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Column(
                              children: [
                                _getFollowingRow(
                                    index, ActivityStatus.following),
                                _getLikesRow(index, ActivityStatus.likes),
                              ],
                            );
                          },
                          childCount: 3,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Text(
                            'This Week',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'GB',
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Column(
                              children: [
                                _getFollowBackRow(
                                    index, ActivityStatus.followBack),
                              ],
                            );
                          },
                          childCount: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getFollowers(int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          child: Row(
            children: [
              SizedBox(width: 7),
              Container(
                height: 43,
                width: 43,
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
                        child: Image.asset('images/story$index.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getClassList()[0].storys![index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'GB',
                    ),
                  ),
                  Text(
                    getClassList()[3].username![index],
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                      fontFamily: 'GB',
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 36,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                      fontFamily: 'GB',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Image.asset('images/icon_menu.png')
            ],
          ),
        ),
      ],
    );
  }

  Widget _getFollowingRow(int index, ActivityStatus status) {
    return Column(
      children: [
        _getActivitiCases(status, index),
      ],
    );
  }

  Widget _getFollowBackRow(int index, ActivityStatus status) {
    return Column(
      children: [
        _getActivitiCases(status, index),
      ],
    );
  }

  Widget _getLikesRow(int index, ActivityStatus status) {
    return Column(
      children: [
        _getActivitiCases(status, index),
      ],
    );
  }

  Widget _getActivitiCases(ActivityStatus status, int index) {
    switch (status) {
      case ActivityStatus.following:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          child: Row(
            children: [
              SizedBox(width: 7),
              Container(
                height: 43,
                width: 43,
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
                        child: Image.asset('images/story$index.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                getClassList()[0].storys![index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Started following you',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontSize: 12,
                  fontFamily: 'GB',
                ),
              ),
              Spacer(),
              Container(
                height: 36,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Massage',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                      fontFamily: 'GB',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case ActivityStatus.followBack:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          child: Row(
            children: [
              SizedBox(width: 7),
              Container(
                height: 43,
                width: 43,
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
                        child: Image.asset('images/face$index.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                getClassList()[2].thisWeekText![index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(width: 5),
              Text(
                'follow back',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontSize: 12,
                  fontFamily: 'GB',
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF35383),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  textStyle: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 14,
                  ),
                ),
                onPressed: () {},
                child: Text('follow'),
              )
            ],
          ),
        );

      case ActivityStatus.likes:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          child: Row(
            children: [
              SizedBox(width: 7),
              Container(
                height: 43,
                width: 43,
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
                        child: Image.asset('images/story$index.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                getClassList()[0].storys![index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(width: 5),
              Text(
                'liked your post',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontSize: 12,
                  fontFamily: 'GB',
                ),
              ),
              Spacer(),
              Container(
                height: 48,
                width: 48,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                      child: Image.asset('images/post0.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
