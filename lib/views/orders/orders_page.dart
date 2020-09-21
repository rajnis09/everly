import 'package:flutter/material.dart';

import '../../utils/theme/theme_data.dart';

class OrdersPage extends StatelessWidget {
  final _divider = Divider(
    color: CustomThemeData.greyColorShade,
    thickness: .5,
    indent: 8,
    endIndent: 8,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Padding(
          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: GestureDetector(
            // The functionality is to be changed as same page is opening everytime
            onTap: () {
              Navigator.pushNamed(context, '/orderDetailsPage');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  color: CustomThemeData.greyColorShade.withOpacity(.2),
                  width: 1,
                ),
              ),
              child: Container(
                width: 400,
                height: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _cardTop(),
                    _divider,
                    _cardMiddle(),
                    _divider,
                    _cardBottom(),
                  ],
                ),
              ),
              elevation: 2,
            ),
          ),
        );
      },
      itemCount: 8,
    );
  }
}

Widget _cardTop() {
  return Padding(
    padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 50.0,
          width: 60.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "assets/images/gupta.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 0),
              child: Text(
                'Gupta General Store',
                style: TextStyle(
                  color: CustomThemeData.blackColorShade1,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              'Budh Vihar, Alwar',
              style: TextStyle(
                color: CustomThemeData.greyColorShade,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _cardMiddle() {
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'ITEMS',
            style: TextStyle(
              color: CustomThemeData.greyColorShade,
            ),
          ),
          Text(
            '5 x Items',
            style: TextStyle(
              color: CustomThemeData.blackColorShade3,
              fontSize: 14,
              // fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'ORDERED ON',
            style: TextStyle(
              color: CustomThemeData.greyColorShade,
            ),
          ),
          Text(
            '28 Feb 2020 at 1:36 PM',
            style: TextStyle(
              color: CustomThemeData.blackColorShade3,
              fontSize: 14,
              // fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'TOTAL AMOUNT',
            style: TextStyle(
              color: CustomThemeData.greyColorShade,
            ),
          ),
          Text(
            '\u20B9480.00',
            style: TextStyle(
              color: CustomThemeData.blackColorShade3,
              fontSize: 14,
              // fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _cardBottom() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Text(
        'Delivered',
        style: TextStyle(
          color: CustomThemeData.greyColorShade,
        ),
      ),
    ),
  );
}
