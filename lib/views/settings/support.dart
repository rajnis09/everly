import 'package:flutter/material.dart';

import '../../utils/theme/theme_data.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _appbar = AppBar(
      title: const Text('Help & Support'),
    );
    var bar = _appbar.preferredSize.height;
    var size = MediaQuery.of(context).size.height;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    final List<Query> data = <Query>[
      Query(
        'Where is my order?',
        <Query>[
          Query(
            'You can track your order in my order section.',
          ),
        ],
      ),
      Query(
        'Did your app provide delivery services?',
        <Query>[
          Query(
            'No , this app only provides you the platform to place the order from your own place , We does not provide any such facility.',
          ),
        ],
      ),
      Query(
        'How can I cancel my order?',
        <Query>[
          Query(
            'Everly provides easy and hassel-free cancellation. You can can the order via app before it is packed.',
          ),
        ],
      ),
      Query(
        'What if I want to return something?',
        <Query>[
          Query(
            'If you are disatisfied with the products deliverd,please contanct to the seller as soon as possible , the app does not provide any such service.',
          ),
        ],
      ),
      Query(
        'What is minimum order value?',
        <Query>[
          Query(
            'There is no minimum order value. However each store can have some minimum order value.',
          ),
        ],
      ),
      Query(
        'Can I schedule an order to my convinence?',
        <Query>[
          Query(
            'Sure, Its seller and customer mutual understanding.',
          ),
        ],
      ),
      Query(
        'Where is my order?',
        <Query>[
          Query(
            'You can track your order in my order section.',
          ),
        ],
      ),
      Query(
        'Where is my order?',
        <Query>[
          Query(
            'You can track your order in my order section.',
          ),
        ],
      ),
      Query(
        'Where is my order?',
        <Query>[
          Query(
            'You can track your order in my order section.',
          ),
        ],
      ),
      Query(
        'Where is my order?',
        <Query>[
          Query(
            'You can track your order in my order section.',
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
              itemBuilder: (context, index) => QueryItem(data[index]),
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
                      'Still need help? Write to us',
                      style: CustomThemeData.robotoFont.copyWith(
                        fontSize: 18,
                        color: CustomThemeData.whiteColor,
                      ),
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
