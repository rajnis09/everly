import 'package:everly/utils/theme/theme_data.dart';
import 'package:flutter/material.dart';

import 'package:everly/model/notification_manager.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> tempMessage = notify.getMessage;

  removeMsg(index) {
    setState(() {
      notify.delMessage(index);
      tempMessage = notify.getMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: tempMessage.length > 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  final keyItem = tempMessage[index];
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    key: Key(keyItem),
                    onDismissed: (direction) {
                      removeMsg(index);
                      // Show a snackbar. This snackbar could also contain "Undo" actions.
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Notification removed successfully')));
                    },
                    child: Container(
                      height: 90,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.all(0),
                        child: Center(
                            child: Text(
                          tempMessage[index],
                          style:
                              TextStyle(color: CustomThemeData.buleColorShade1),
                        )),
                      ),
                    ),
                  );
                },
                itemCount: tempMessage.length,
              )
            : Center(child: Text('No notifications yet :)')));
  }
}
