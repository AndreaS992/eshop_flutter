import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
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
    );
  }
}
