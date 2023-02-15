import 'package:flutter/material.dart';

class ItemMenuProvider with ChangeNotifier {
  List<int> favouriteItems = [];

  setFavouriteItem(int index) {
    favouriteItems.add(index);
    notifyListeners();
  }

  removeFavouriteItem(int index) {
    favouriteItems.remove(index);
    notifyListeners();
  }
}
