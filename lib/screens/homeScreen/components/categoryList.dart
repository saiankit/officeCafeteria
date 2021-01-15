import 'package:flutter/material.dart';
import 'package:officecafeteria/providers/categoriesProvider.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 1;
  List categories = ['Food', 'Snacks', 'Bevarages', 'Icecreams & Cakes'];
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context, cat, _) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              cat.changeCategory(index);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 20,
                right: index == categories.length - 1 ? 20 : 0,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color:
                    index == selectedIndex ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                categories[index],
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
