import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MassageScreen extends StatelessWidget {
  const MassageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            _getHeader(),
            SizedBox(height: 40),
            _getContent(context),
            SizedBox(height: 290),
            _getMassage(),
          ],
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 27,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.5,
                color: Color(0xffF35383),
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
                    child: Image.asset('images/poya.png'),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Poya Aghajani',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GB',
                ),
              ),
              Text(
                '_Poya.3',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GB',
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.phone,
              color: Color(0xffC5C5C5),
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.video,
              color: Color(0xffC5C5C5),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 120,
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Container(
                child: Image.asset('images/poya.png'),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '_Poya.3',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 18,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Is on Moodinger',
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'GB',
            fontSize: 18,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'You both follow David and 3 others',
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'GB',
            fontSize: 18,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Not have any massages yet',
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'GB',
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: BorderSide(width: 2, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            minimumSize: Size(130, 36),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'View Profile',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getMassage() {
    return Container(
      width: 385,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        color: Color(0xff272B40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.camera,
              color: Color(0xffC5C5C5),
              size: 22,
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Massage...',
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.microphone,
              color: Color(0xffC5C5C5),
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.image,
              color: Color(0xffC5C5C5),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
