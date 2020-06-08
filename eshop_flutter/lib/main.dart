import 'dart:ui';
import 'dart:math';

import 'package:eshopflutter/dummy_data.dart';
import 'package:eshopflutter/widgets/categories_row.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshopflutter/widgets/carousel.dart';
import 'package:flutter/services.dart';

import 'package:eshopflutter/widgets/top_appbar.dart';

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
        extendBodyBehindAppBar: true,
        body: ScrollViewPersonale(),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.lightBlueAccent,
        ),
        height: MediaQuery.of(context).size.width / 2 - 20,
        width: MediaQuery.of(context).size.height / 100 * 25,
        child: Text('ProductCard'),
      ),
    );
  }
}

class ScrollViewPersonale extends StatefulWidget {
  @override
  _ScrollViewPersonaleState createState() => _ScrollViewPersonaleState();
}

class _ScrollViewPersonaleState extends State<ScrollViewPersonale> {
  List<int> listaDiProva = [1, 2, 3, 4, 5];
  ScrollController _myController = ScrollController(initialScrollOffset: 55);
  double _appBarOpacity = 0;

  _scrollListener() {
//    print(_myController.offset);
//    _myController.jumpTo(55);
    var tempOffset = _myController.offset;
    var percentuale;

    if (tempOffset >= 120) {
      percentuale = double.parse(((tempOffset - 120) / 150).toStringAsFixed(1));

      if (((_appBarOpacity - percentuale).abs() > 0.1) && (percentuale <= 1)) {
        _appBarOpacity = double.parse(percentuale.toStringAsFixed(1));
        setState(() {
          _appBarOpacity = _appBarOpacity;
        });
      }
    }
    if (_myController.offset < 55) {
      _myController.jumpTo(55);
    }
  }

  @override
  Widget build(BuildContext context) {
    _myController.addListener(_scrollListener);

    return Container(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        controller: _myController,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.orange.withOpacity(_appBarOpacity),
            pinned: true,
            flexibleSpace: TopAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.lightBlueAccent,
                      ),
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          width: double.infinity,
                          height: 200, //Dimensione stack di base
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
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        top: 55,
                        child: CarouselWithIndicator(listaDiProva: listaDiProva),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    height: 40,
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('List Item $index'),
                  );
                }
              },
              childCount: 50,
            ),
          ),
        ],
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
//
//Scaffold(
//body: SingleChildScrollView(
//child: Column(
//children: <Widget>[
//Stack(
//children: <Widget>[
//ClipPath(
//clipper: MyClipper(),
//child: Container(
//width: double.infinity,
//height: 300, //Dimensione stack di base
//decoration: BoxDecoration(
//image: DecorationImage(
//image: NetworkImage(
//'https://dpv87w1mllzh1.cloudfront.net/alitalia_discover/attachments/data/000/000/334/original/roma-how-to-carbonara-1920x1080.jpg?1519055920'),
//fit: BoxFit.cover,
//),
//),
//child: BackdropFilter(
//filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//child: Container(
//color: Colors.white.withOpacity(0),
//),
//),
//),
//),
//Column(
//children: <Widget>[
//TopAppBar(),
//SizedBox(
//height: 5,
//width: MediaQuery.of(context).size.width,
//),
//CarouselWithIndicator(listaDiProva: listaDiProva),
//],
//),
//],
//),
//CategoryRow(DUMMY_DATA),
////              Container(
////                height: 400,
////                child: GridView.count(
////                  crossAxisCount: 2,
////                  children: <Widget>[
////                    ProductCard(),
////                    ProductCard(),
////                    ProductCard(),
////                    ProductCard(),
////                    ProductCard(),
////                    ProductCard(),
////                    ProductCard(),
////                    ProductCard(),
////                  ],
////                ),
////              ),
//ScrollViewPersonale(),
////            ProductCard(),
//],
//),
//),
//)
