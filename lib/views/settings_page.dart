import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                  width: size.width * 0.90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
                            child: Icon(
                              Icons.notifications_active,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.orange[50],
                        activeColor: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ),
               Divider(
                  color: Colors.black,
                  thickness: .5,
                  indent: 8,
                  endIndent: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print("Container clicked");
                  },
                  child: Container(
                    height: 50.0,
                    width: size.width * 0.90,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
                          child: Icon(
                            Icons.help,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Help & Support',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .5,
                  indent: 8,
                  endIndent: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print("Container clicked");
                  },
                  child: Container(
                    height: 50.0,
                    width: size.width * 0.90,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
                          child: Icon(
                            Icons.rate_review,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Rate App',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .5,
                  indent: 8,
                  endIndent: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print("Container clicked");
                  },
                  child: Container(
                    height: 50.0,
                    width: size.width * 0.90,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
                          child: Icon(
                            Icons.share,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .5,
                  indent: 8,
                  endIndent: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print("Container clicked");
                  },
                  child: Container(
                    height: 50.0,
                    width: size.width * 0.90,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
                          child: Icon(
                            Icons.collections_bookmark,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Terms of Service',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .5,
                  indent: 8,
                  endIndent: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print("Container clicked");
                  },
                  child: Container(
                    height: 50.0,
                    width: size.width * 0.90,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Sign Out',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .5,
                  indent: 8,
                  endIndent: 8,
                ),
              ],
            ),
          ),
        );
  }
}
