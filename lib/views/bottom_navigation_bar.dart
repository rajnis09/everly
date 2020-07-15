import 'package:flutter/material.dart';

import '../views/home_page.dart';
import '../views/profile_page.dart';
import '../views/orders_page.dart';
import '../views/settings_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
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

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedPageIndex]),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: _FABBottomAppBar(
        // selectedColor: _selectedPageIndex == 4 ? null : Colors.purple,
        // centerItemText: 'Add Shop',
        onTabSelected: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: [
          _FABBottomAppBarItem(
            iconData: Icons.home,
            text: 'Home',
          ),
          _FABBottomAppBarItem(
            iconData: Icons.person,
            text: 'Profile',
          ),
          _FABBottomAppBarItem(
            iconData: Icons.account_balance_wallet,
            text: 'Orders',
          ),
          _FABBottomAppBarItem(
            iconData: Icons.settings,
            text: 'Settings',
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
    // items.insert(items.length >> 1, _buildMiddleTabItem());

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
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
