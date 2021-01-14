import 'package:flutter/material.dart';
import 'package:officecafeteria/models/product.dart';

class CategoriesProvider extends ChangeNotifier {
  int categoryIndex = 1;

  changeCategory(int index) {
    categoryIndex = index;
    notifyListeners();
  }
}

List<Product> bevarages = [
  Product(
    id: 9,
    price: 56,
    title: "Espresso Coffee",
    image: "assets/coffee.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 10,
    price: 39,
    title: "Hot tea",
    image: "assets/hot-tea.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 11,
    price: 39,
    title: "Cola",
    image: "assets/cola.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 12,
    price: 39,
    title: "Cocktail",
    image: "assets/cocktail.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 13,
    price: 39,
    title: "Orange Juice",
    image: "assets/orange-juice.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];
List<Product> icecreams = [
  Product(
    id: 14,
    price: 39,
    title: "Chocolate Sundae",
    image: "assets/choclate-sundae.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 15,
    price: 39,
    title: "Multiflavoured Stick",
    image: "assets/ice-cream (2).svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 16,
    price: 39,
    title: "Banana Split Icecream",
    image: "assets/ice-cream.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 17,
    price: 39,
    title: "Soft Serve Icecream",
    image: "assets/ice-cream (4).svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 18,
    price: 39,
    title: "Strawberry Popsicle",
    image: "assets/strawberry-popsicle.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];

List<Product> cakes = [
  Product(
    id: 19,
    price: 68,
    title: "Pineapple Pastry",
    image: "assets/cake.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 20,
    price: 39,
    title: "Donut",
    image: "assets/donut.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 21,
    price: 39,
    title: "Muffin",
    image: "assets/muffin.svg",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];
