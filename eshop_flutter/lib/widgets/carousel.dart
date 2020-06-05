import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<int> listaDiProva;

  const CarouselWithIndicator({this.listaDiProva});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var lista = widget.listaDiProva;

    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
      ),
      child: Stack(children: [
        CarouselSlider(
          items: lista.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), //Spacing between carousel's images
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
                width: MediaQuery.of(context).size.width,
                child: Text('text $e'),
              ),
            );
          }).toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 3000),
              autoPlayAnimationDuration: Duration(milliseconds: 750),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: lista.map((url) {
                int index = lista.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.black26 : Colors.white30,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ]),
    );
  }
}
