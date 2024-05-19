import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconly/iconly.dart';

void main() {
  runApp(PandaGameApp());
}

class PandaGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PandaGame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/carousel1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        leading: IconButton(
            icon: Image.asset('assets/images/menu.png'),
            onPressed: () {
              print("Pressed");
            }),
        title: Image.asset(
          'assets/images/logo.png',
          width: 162,
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 189.0,
                autoPlay: true,
                viewportFraction: 1,
              ),
              items: imgList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: Image.asset(
                        item,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 33, 0, 0),
              child: Text('Recently top up',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GameIcon('assets/images/game1.png', 'Game 1'),
                      GameIcon('assets/images/game2.png', 'Game 2'),
                      GameIcon('assets/images/game3.png', 'Game 3'),
                    ],
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Popular Game',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GameBanner('assets/images/banner1.png', 'Top Up Diamond Mobile'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class GameIcon extends StatelessWidget {
  final String imageUrl;
  final String title;

  GameIcon(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imageUrl,
            width: 64,
            height: 64,
          ),
        ),
        Text(title),
      ],
    );
  }
}

class GameBanner extends StatelessWidget {
  final String imageUrl;
  final String title;

  GameBanner(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
