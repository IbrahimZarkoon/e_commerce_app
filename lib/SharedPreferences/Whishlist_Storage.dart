import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class WishlistItem {
  final String name;
  final double price;
  final String imageUrl;

  WishlistItem({required this.name, required this.price, required this.imageUrl});

  Map<String, dynamic> toJson() =>
      {'name': name, 'price': price, 'imageUrl': imageUrl};

  factory WishlistItem.fromJson(Map<String, dynamic> json) => WishlistItem(
    name: json['name'],
    price: json['price'],
    imageUrl: json['imageUrl'],
  );
}

class WishlistStorage {
  final SharedPreferences _prefs;

  WishlistStorage(this._prefs);

  Future<void> addItem(WishlistItem item) async {
    final itemsJson = _prefs.getStringList('wishlist') ?? [];
    final itemJson = jsonEncode(item.toJson());
    itemsJson.add(itemJson);
    await _prefs.setStringList('wishlist', itemsJson);
  }

  Future<void> removeItem(WishlistItem item) async {
    final itemsJson = _prefs.getStringList('wishlist') ?? [];
    final itemJson = jsonEncode(item.toJson());
    itemsJson.remove(itemJson);
    await _prefs.setStringList('wishlist', itemsJson);
  }

  List<WishlistItem> getItems() {
    final itemsJson = _prefs.getStringList('wishlist') ?? [];
    return itemsJson.map((itemJson) => WishlistItem.fromJson(jsonDecode(itemJson))).toList();
  }
}