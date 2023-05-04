import 'package:flutter/material.dart';

class Product {
   String id;
   String? title;
   int? quantity;
   double? price;

  Product({
    required this.id,
     this.title,
     this.quantity,
     this.price,
  });
}

class CartProvider with ChangeNotifier {
  List<Product> productsList = [];

  void addProduct(Product product) {
    int Index = getIndex(product.id);
    if (Index >= 0) {
      productsList.add(product);
      notifyListeners();
    } else {
      productsList[Index].quantity = productsList[Index].quantity! + 1;
      notifyListeners();
    }
    print("PRODUCTQTYY+=====${productsList[Index].quantity}");
  }

  int getIndex(id) {
    var index = productsList.indexWhere((element) => element.id == id);
    return index;
  }

  int getQty(Product p) {
    var index = getIndex(p.id);
    return productsList[index].quantity!;
  }

  void increment(Product p) {
    int Index = getIndex(p.id);
    if (Index != -1) {
      productsList[Index].quantity = productsList[Index].quantity! + 1;
      //String? color = productsList[Index].color;

      notifyListeners();
    }
    getTotalPrice();
    notifyListeners();
  }

  void decrement(Product p) {
    print('decremtn func');
    int Index = getIndex(p.id);
    if (Index != -1) {
      productsList[Index].quantity = productsList[Index].quantity! - 1;
      if (productsList[Index].quantity! <= 0) {
        productsList[Index].quantity = 0;
      }
      notifyListeners();
    }
    getTotalPrice();
    notifyListeners();
  }

  bool isProductAdded(Product p) {
    int index = getIndex(p.id);
    if (index == -1) {
      return false;
    }
    return true;
  }

  notifyListeners();


  void removeProduct(int id)
  {
    int index = getIndex(id);
    if (index >= 0) {
      if (productsList[index].id == id) {
        productsList.removeAt(index);
        notifyListeners();
      }
    }
  }

  double getTotalPrice() {
    double totalSum = 0.0;
    double inDouble=0.0;
    String? inString;
    for(var item in productsList) {
      totalSum += item.price! * item.quantity!;
      print("totalSum=======${totalSum}");
      inString = totalSum.toStringAsFixed(2);
      inDouble = double.parse(inString);
    }
    return
      inDouble;

  }

  void clear()
  {
    productsList = [];
    notifyListeners();
  }
}