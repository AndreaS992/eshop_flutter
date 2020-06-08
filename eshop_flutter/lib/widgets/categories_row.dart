import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final Map<String, String> categoryMap;
  const CategoryRow(this.categoryMap);

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categoryItemList = [];
    categoryMap.forEach((key, value) {
      categoryItemList.add(CategoryItem(categoryImageUrl: value, categoryTitle: key));
    });
    return Row(
      children: <CategoryItem>[...categoryItemList],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class CategoryItem extends StatelessWidget {
  final categoryImageUrl;
  final categoryTitle;

  const CategoryItem({@required this.categoryImageUrl, @required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Container(
              width: ((MediaQuery.of(context).size.width - 50) / 8),
              child: Image.network(categoryImageUrl, fit: BoxFit.fill),
            ),
            Text('$categoryTitle'),
          ],
        ),
      ),
    );
  }
}
