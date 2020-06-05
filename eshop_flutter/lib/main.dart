import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshopflutter/widgets/carousel.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  CarouselController buttonCarouselController = CarouselController();
  List<int> listaDiProva = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 300, //Dimensione stack di base
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://dpv87w1mllzh1.cloudfront.net/alitalia_discover/attachments/data/000/000/334/original/roma-how-to-carbonara-1920x1080.jpg?1519055920'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.white.withOpacity(0),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                        right: 5,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white70),
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                fillColor: Color(0xBF111111),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.white30),
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  color: Colors.white70,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.black87,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                      width: MediaQuery.of(context).size.width,
                    ),
                    CarouselWithIndicator(listaDiProva: listaDiProva),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height / 1.8);
    path.quadraticBezierTo(size.width / 2, size.height - 50, size.width, size.height / 1.8);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CarouselSliderFunzionante extends StatelessWidget {
  const CarouselSliderFunzionante({
    Key key,
    @required this.listProva,
  }) : super(key: key);

  final List<int> listProva;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: listProva.map((i) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.amber),
          child: Text(
            'text $i',
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        autoPlayInterval: Duration(milliseconds: 3000),
        autoPlayAnimationDuration: Duration(milliseconds: 750),
      ),
    );
  }
}

//Padding(
//padding: const EdgeInsets.only(
//top: 5,
//left: 10,
//right: 5,
//),
//child: Row(
//children: <Widget>[
//Expanded(
//child: TextField(
//style: TextStyle(color: Colors.white70),
//onSubmitted: (value) {},
//decoration: InputDecoration(
//fillColor: Color(0xBF111111),
//filled: true,
//border: OutlineInputBorder(
//borderRadius: BorderRadius.circular(10),
//borderSide: BorderSide.none,
//),
//contentPadding: EdgeInsets.symmetric(horizontal: 10),
//hintText: 'Search',
//hintStyle: TextStyle(color: Colors.white30),
//prefixIcon: IconButton(
//icon: Icon(Icons.search),
//color: Colors.white70,
//onPressed: () {},
//),
//),
//),
//),
//IconButton(
//icon: Icon(Icons.menu),
//color: Colors.black87,
//onPressed: () {},
//),
//],
//),
//),
//SizedBox(
//height: 5,
//width: MediaQuery.of(context).size.width,
//),
//Container(
//padding: const EdgeInsets.only(
//top: 5,
//left: 5,
//right: 5,
//),
//child: CarouselWithIndicator(listaDiProva: listaDiProva),
//),
