import 'package:flutter/material.dart';

import '../../utils/theme/theme_data.dart';
import '../../helpers/locale/app_localization.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalization.of(context);
    var _appbar = AppBar(
      title: const Text('Help & Support'),
    );
    var bar = _appbar.preferredSize.height;
    var size = MediaQuery.of(context).size.height;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    final List<Query> data = <Query>[
      Query(
        locale.q1,
        <Query>[
          Query(
            locale.a1,
          ),
        ],
      ),
      Query(
        locale.q2,
        <Query>[
          Query(
            locale.q2,
          ),
        ],
      ),
      Query(
        locale.q3,
        <Query>[
          Query(
            locale.q3,
          ),
        ],
      ),
      Query(
        locale.q4,
        <Query>[
          Query(
            locale.q4,
          ),
        ],
      ),
      Query(
        locale.q5,
        <Query>[
          Query(
            locale.q5,
          ),
        ],
      ),
      Query(
        locale.q6,
        <Query>[
          Query(
            locale.q6,
          ),
        ],
      ),
      Query(
        locale.q7,
        <Query>[
          Query(
            locale.q7,
          ),
        ],
      ),
      Query(
        locale.q8,
        <Query>[
          Query(
            locale.q8,
          ),
        ],
      ),
      Query(
        locale.q9,
        <Query>[
          Query(
            locale.q9,
          ),
        ],
      ),
      Query(
        locale.q10,
        <Query>[
          Query(
            locale.q10,
          ),
        ],
      ),
    ];
    return Scaffold(
      appBar: _appbar,
      body: Column(
        children: <Widget>[
          Container(
            height: (size - statusBarHeight - bar) * .9,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  QueryItem(data[index]),
              itemCount: data.length,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Container(
              height: (size - statusBarHeight - bar) * .1,
              width: double.infinity,
              color: CustomThemeData.blueColorShade1,
              child: GestureDetector(
                onTap: () => print("Help & Support using email"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: 40,
                      color: CustomThemeData.whiteColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      locale.stillNeedHelp,
                      style: CustomThemeData.robotoFont.copyWith(
                          fontSize: 18, color: CustomThemeData.whiteColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Query {
  Query(this.title, [this.children = const <Query>[]]);

  final String title;
  final List<Query> children;
}

class QueryItem extends StatelessWidget {
  const QueryItem(this.query);

  final Query query;

  Widget _buildTiles(Query root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Query>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(query);
  }
}
