import 'package:comp2/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class Products with ChangeNotifier{
  bool filtered = false;
  bool sorted = false;
  List<ProductModel> filteredItems = [];
  List<ProductModel> sortedItems = [];
  final List<ProductModel> _items = [
    ProductModel(
        name: "Milk",
        url: "assets/images/süt.jpg",
        category: "Dairy Products",
        brand: "Icim",
        marketBrand:"A101",
    price: 10.99,
    date: DateTime(2022,10,9)),
    ProductModel(
        name: "Coke",
        url: "assets/images/kola.jpg",
        category: "Drinks",
        brand: "CocaCola",
        marketBrand:"BIM",
        price: 10.99,
        date: DateTime(2022,10,9)),

    ProductModel(
        name: "Cheese",
        url: "assets/images/peynir.jpg",
        category: "Dairy Products",
        brand: "Icim",
        marketBrand:"A101",
        price: 10.99,
        date: DateTime(2022,10,9)),
    ProductModel(
        name: "Yogurt",
        url: "assets/images/yogurt.jpg",
        category: "Dairy Products",
        brand: "Icim",
        marketBrand:"A101",
        price: 10.99,
        date: DateTime(2022,10,9)),
  ];
  filterList(filteredProduct) {
    filtered = true;
    filteredItems = [..._items];
    filteredItems.retainWhere((element) {
      return element.category!.contains(filteredProduct);
    });
    notifyListeners();
  }
  filterSorted(filteredProduct) {
    sorted = true;
    sortedItems = [..._items];
    sortedItems.retainWhere((element) {
      return element.category!.contains(filteredProduct);
    });
    notifyListeners();
  }


  updateList(product) {
    _items.add(product);
    notifyListeners();
  }
}