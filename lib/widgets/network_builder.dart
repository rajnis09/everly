import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/connectivity_provider.dart';
import '../utils/theme/theme_data.dart';

class NetworkBuilder extends StatelessWidget {
  final Widget child;

  const NetworkBuilder({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConnectionStatus connectionStatus = Provider.of<ConnectionStatus>(context);
    final size = MediaQuery.of(context).size;
    if (connectionStatus == ConnectionStatus.offline) {
      return SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: size.width * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/shocked.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Oops!!\nNo Internet Connection\nPlease connect to internet',
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.center,
                  style: CustomThemeData.montserratFont.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.035,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );
    }
    return SafeArea(child: child);
  }
}
