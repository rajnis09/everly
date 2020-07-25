import 'package:everly/helpers/locale/app_localization.dart';
import 'package:flutter/material.dart';
import '../model/list_profile_section.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ListProfileSection> listSection = new List();
  AppLocalization locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalization.of(context);
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection(locale.changePassword, Icons.mode_edit, () {
      print('Change Password');
    }));
    listSection.add(createSection(locale.addressMan, Icons.mode_edit, () {
      print('Address Mangement');
    }));
    listSection.add(createSection(locale.logout, Icons.exit_to_app, () {
      print('Logout');
    }));
  }

  createSection(String title, IconData icon, Function onpressed) {
    return ListProfileSection(title, icon, onpressed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Builder(builder: (context) {
        return Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff0F2027),
                      Color(0xff203A43),
                      Color(0xff2C5364)
                    ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    locale.profile,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 85, left: 24),
                ),
              ),
              Container(
                height: 380,
                margin: EdgeInsets.only(
                  top: 150,
                ),
                // color : Colors.red,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Card(
                        margin: EdgeInsets.only(top: 50, left: 16, right: 16),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        )),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: 8, top: 8, right: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    color: Colors.black,
                                    iconSize: 24,
                                    onPressed: () {},
                                  ),
                                  // IconButton(
                                  //   icon: Icon(Icons.shopping_cart),
                                  //   color: Colors.black,
                                  //   iconSize: 24,
                                  //   onPressed: () {},
                                  // )
                                ],
                              ),
                            ),
                            Text(
                              "Yash Khandelwal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "9876543210",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "khandelwalyashykc@gmail.com",
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: Colors.grey.shade200,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Builder(builder: (context) {
                                  return InkWell(
                                    splashColor: Colors.grey.shade200,
                                    onTap: listSection[index].onpressed,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 16, right: 12),
                                      padding:
                                          EdgeInsets.only(top: 12, bottom: 12),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(listSection[index].icon),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            listSection[index].title,
                                            style: TextStyle(
                                                color: Colors.grey.shade500),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Icon(
                                            Icons.navigate_next,
                                            color: Colors.grey.shade500,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                              itemCount: listSection.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 2),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/1.png"),
                                  fit: BoxFit.cover)),
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
