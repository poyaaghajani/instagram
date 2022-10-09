import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_ui/Constants/constants.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({Key? key, this.controller}) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 40,
          sigmaY: 40,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: BoxDecoration(),
            child: _getBottomSheetDecoration(context),
          ),
        ),
      ),
    );
  }

  Widget _getBottomSheetDecoration(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    height: 5,
                    width: 67,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'GB',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png')
                    ],
                  ),
                  SizedBox(height: 36),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Image.asset('images/icon_search.png'),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'search...',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (contex, index) {
                  return _getBottomSheetPictures(index);
                },
                childCount: 15,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 13,
                  mainAxisExtent: 100),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 70),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          child: Container(
            width: 129,
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Send'),
            ),
          ),
        )
      ],
    );
  }

  Widget _getBottomSheetPictures(int index) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
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
                  child: Image.asset('images/story$index.png'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          getClassList()[0].storys![index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GB',
            fontSize: 12,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
