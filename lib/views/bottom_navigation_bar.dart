import 'package:flutter/material.dart';

import '../utils/theme/theme_data.dart';
import '../views/home_page.dart';
import '../views/profile_page.dart';
import '../views/orders_page.dart';
import '../views/settings_page.dart';
import '../helpers/locale/app_localization.dart';
import '../model/notification_manager.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({
    this.changeToHindi,
    this.changeToEnglish,
  });

  final Function changeToHindi;
  final Function changeToEnglish;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
    OrdersPage(),
    SettingsPage(),
    // AddShopPage(),
  ];
  final List<String> _titles = [
    'Home',
    'My Profile',
    'My Orders',
    'Settings',
    // 'Add Shop'
  ];

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      notify.addMessage(message['data']['title']);
    }, onResume: (Map<String, dynamic> message) async {
      if (message != null) {
        notify.addMessage(message['data']['title']);
        Navigator.of(context).pushNamed(
          '/notificationPage',
        );
      }
    }, onLaunch: (Map<String, dynamic> message) async {
      notify.addMessage(message['data']['title']);
    });
  }

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalization.of(context);
    final List<String> _titles = [
      locale.home,
      locale.profile,
      locale.myOrders,
      locale.settings,
      // 'Add Shop'
    ];
    final List<Widget> _pages = [
      HomePage(),
      ProfilePage(),
      OrdersPage(),
      SettingsPage(
        changeToHindi: widget.changeToHindi,
        changeToEnglish: widget.changeToEnglish,
      ),
    ];

    return Scaffold(
      appBar: _selectedPageIndex != 1
          ? AppBar(
              title: Text(_titles[_selectedPageIndex]),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/notificationPage');
                      },
                      child: Icon(
                        Icons.notifications_none,
                        size: 25,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/cartPage');
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        size: 25,
                      ),
                    )),
              ],
            )
          : null,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: _FABBottomAppBar(
        selectedColor:
            _selectedPageIndex == 4 ? null : CustomThemeData.blueColorShade1,
        onTabSelected: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: [
          _FABBottomAppBarItem(
            iconData: Icons.home,
            text: locale.home,
          ),
          _FABBottomAppBarItem(
            iconData: Icons.person,
            text: locale.profile,
          ),
          _FABBottomAppBarItem(
            iconData: Icons.account_balance_wallet,
            text: locale.myOrders,
          ),
          _FABBottomAppBarItem(
            iconData: Icons.settings,
            text: locale.settings,
          ),
        ],
      ),
    );
  }
}

class _FABBottomAppBarItem {
  _FABBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class _FABBottomAppBar extends StatefulWidget {
  _FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<_FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends State<_FABBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    _FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  item.iconData,
                  color: color,
                  size: widget.iconSize,
                ),
                Text(
                  item.text,
                  style: CustomThemeData.robotoFont.copyWith(
                    color: CustomThemeData.blackColorShade1,
                  ),
                  textScaleFactor: 1.01,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
