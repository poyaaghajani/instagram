import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _getHeader(),
                  ),
                  SliverToBoxAdapter(
                    child: _getMoonPic(),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (contex, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Container(
                              child: Image.asset('images/gallary$index.png'),
                            ),
                          ),
                        );
                      },
                      childCount: 9,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 90),
                  ),
                ],
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Color(0xff1C1F2E),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Draft',
                        style: TextStyle(
                          color: Color(0xffF35383),
                          fontFamily: 'GB',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Gallary',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GB',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Take',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GB',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 20,
            ),
          ),
          SizedBox(width: 15),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 20,
            ),
          ),
          SizedBox(width: 15),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }

  Widget _getMoonPic() {
    return Container(
      width: 394,
      height: 375,
      child: Image.asset('images/moon.png'),
    );
  }
}
