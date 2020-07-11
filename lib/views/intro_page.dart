import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> titles = [
    "Welcome",
    "Everly App",
    "Your App",
  ];
  final List<String> subtitles = [
    "Welcome to Everly",
    "Say no to queues by everly",
    "Easy to place order",
  ];
  final List<Color> colors = [
    Colors.purple.shade300,
    Colors.blue.shade300,
    Colors.indigo.shade300,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red,
                activeSize: 15.0,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return IntroItem(
                title: titles[index],
                subtitle: subtitles[index],
                bg: colors[index],
                imageUrl: "assets/images/${index + 1}.png",
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                // color: Colors.orange[700],
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/homePage');
                },
                // shape: RoundedRectangleBorder(
                //   borderRadius: new BorderRadius.circular(30.0),
                // ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              color: Colors.white,
              icon:
                  Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward),
              onPressed: () {
                _currentIndex != 2
                    ? _controller.next()
                    : Navigator.of(context).pushReplacementNamed('/homePage');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bg;
  final String imageUrl;

  const IntroItem(
      {Key key, @required this.title, this.subtitle, this.bg, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            children: <Widget>[
              // const SizedBox(height: 40.0),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                margin: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    30,
                    // bottomLeft: Radius.circular(30.0),
                    // bottomRight: Radius.circular(30.0),
                  ),
                  child: Material(
                    elevation: 4.0,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.white),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 10.0),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
