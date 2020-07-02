import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> dummyData = [
    {
      "image": "assets/images/Sweets.jpg",
      "shopName": "Desserts",
      "sellerName": "The Sweetman",
      "category": "Sweets",
    },
    {
      "image": "assets/images/grocery.jpg",
      "shopName": "Fresh'O Juicy",
      "sellerName": "The Freshman",
      "category": "Grocery",
    },
    {
      "image": "assets/images/Foodmart.jpg",
      "shopName": "Food Mart",
      "sellerName": "The Foodman",
      "category": "Supermart",
    },
    {
      "image": "assets/images/need.jpg",
      "shopName": "Essestianls",
      "sellerName": "The Needman",
      "category": "Daily Needs",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.18,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.02),
            ),
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(
                              MediaQuery.of(context).size.height * 0.02)),
                      child: Image.asset(
                        dummyData[index]['image'],
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height *
                            (0.18 - (0.01)),
                      )),
                ),
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  width: MediaQuery.of(context).size.width * (1 - (0.46)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: FittedBox(
                          child: Text(dummyData[index]['shopName'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.04,
                                    color: Colors.orange[700],
                                    fontWeight: FontWeight.bold,
                                  )),
                        ),
                      ),
                      FittedBox(
                        child: Text(dummyData[index]['sellerName'],
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Colors.black87,
                                  // fontWeight: FontWeight.bold,
                                )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dummyData[index]['category'],
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.black54,
                                  // fontWeight: FontWeight.bold,
                                ),
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.orange[700],
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
      },
      itemCount: dummyData.length,
    );
  }
}
