import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_ui/Constants/constants.dart';
import 'package:instagram_ui/Screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('images/icon_direct.png'),
        ],
        elevation: 0,
        backgroundColor: Color(0xff1C1F2E),
        title: Container(
          height: 24,
          width: 128,
          child: Image.asset('images/moodinger_logo.png'),
        ),
      ),
      backgroundColor: Color(0xff1C1F2E),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getAllStorys(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff323A99),
                  minimumSize: Size(400, 20),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: DraggableScrollableSheet(
                            initialChildSize: 0.45,
                            minChildSize: 0.2,
                            maxChildSize: 0.59,
                            builder: (BuildContext context, controller) {
                              return ShareBottomSheet(
                                controller: controller,
                              );
                            },
                          ),
                        );
                      });
                },
                child: Text('Share Bottom'),
              ),
              _getHomeContent(),
              SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAllStorys() {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0 ? _getYourStoryBox() : _getStoryBox(index);
        },
      ),
    );
  }

  Widget _getYourStoryBox() {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Image.asset('images/icon_plus.png'),
        ),
        SizedBox(height: 8),
        Text(
          'your story',
          style: TextStyle(
            fontFamily: 'SM',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _getStoryBox(int index) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.5,
              color: _getStoryBorderColor(index),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(29),
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
        SizedBox(
          height: 8,
        ),
        Text(
          getClassList()[0].storys![index],
          style: TextStyle(
            fontFamily: 'SM',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Color _getStoryBorderColor(int index) {
    if (index == 2) {
      return Colors.green;
    } else if (index == 4) {
      return Colors.green;
    } else if (index == 9) {
      return Colors.green;
    } else {
      return Color(0xffF35383);
    }
  }

  Widget _getHomeContent() {
    return Column(
      children: [
        SizedBox(height: 15),
        _getPostHeader('Poya Aghajani', 'Developer', 'poya'),
        SizedBox(height: 25),
        _getPostContent('post0', '10K', '2K'),
        SizedBox(height: 34),
        _getPostHeader('Jordan Smith', 'BMW', 'face1'),
        SizedBox(height: 25),
        _getPostContent('post1', '2.5K', '1K'),
        SizedBox(height: 34),
        _getPostHeader('Sarah Kelareck', 'Ecotourist', 'face2'),
        SizedBox(height: 25),
        _getPostContent('post2', '4.4K', '3K'),
        SizedBox(height: 34),
        _getPostHeader('Mikel Anderson', 'Socer Player', 'face3'),
        SizedBox(height: 25),
        _getPostContent('post3', '8.2K', '400'),
        SizedBox(height: 34),
        _getPostHeader('James Dep', 'Photographer', 'face4'),
        SizedBox(height: 25),
        _getPostContent('post4', '3K', '1.5K'),
        SizedBox(height: 25),
      ],
    );
  }

  Widget _getPostHeader(String name, String job, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
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
                    child: Image.asset('images/$image.png'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'GB',
                  ),
                ),
                Text(
                  '$job',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'GB',
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getPostContent(String image, String like, String comment) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 440,
          width: 394,
        ),
        Positioned(
          top: 0,
          child: Container(
            height: 394,
            width: 370,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/$image.png'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 25,
          child: Image.asset('images/icon_video.png'),
        ),
        Positioned(
          bottom: 25,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                width: 340,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.6),
                      Color.fromRGBO(255, 255, 255, 0.2),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 25),
                    Image.asset('images/icon_hart.png'),
                    SizedBox(width: 5),
                    Text(
                      '$like',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 35),
                    Image.asset('images/icon_comments.png'),
                    SizedBox(width: 5),
                    Text(
                      '$comment',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 35),
                    Image.asset('images/icon_share.png'),
                    SizedBox(width: 40),
                    Image.asset('images/icon_save.png'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
