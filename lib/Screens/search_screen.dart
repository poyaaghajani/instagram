import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_ui/Constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: _getCategorys(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
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
                              child: Image.asset('images/item$index.png'),
                            ),
                          ),
                        ),
                    childCount: 10),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: Container(
        width: 340,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
          color: Color(0xff272B40),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/icon_search.png'),
              SizedBox(width: 6),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Image.asset('images/icon_scan.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategorys() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 23,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 13, right: 13),
              decoration: BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  getClassList()[1].categorys![index],
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
