import 'package:flutter/material.dart';

import '../../widgets/build_list_items.dart';
import '../../utils/theme/theme_data.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    buildListItem(
                      context,
                      'Greviance',
                      Icons.description,
                      null,
                      () {},
                      size.height * 0.025,
                    ),
                    divider,
                    buildListItem(
                      context,
                      'Open Source Licenses',
                      Icons.perm_device_information,
                      null,
                      () {},
                      size.height * 0.025,
                    ),
                    divider,
                    buildListItem(
                      context,
                      'About us',
                      Icons.group,
                      null,
                      () {},
                      size.height * 0.025,
                    ),
                    divider,
                  ],
                )),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 4),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Version 0.0.1',
                style: CustomThemeData.montserratFont.copyWith(
                  color: CustomThemeData.greyColorShade,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
