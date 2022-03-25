import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:poshan/models/food_details.dart';

class FoodDetailsProvider extends ChangeNotifier {

  List<Parsed> _foodDetails = [];

  void setFoodDetails(Parsed foodDetails) {
    _foodDetails.add(foodDetails);
    notifyListeners();
  }

  void removeFoodDetailsAt(int index) {
    _foodDetails.removeAt(index);
    notifyListeners();
  }

  List<Parsed> getFoodDetails() {
    return _foodDetails;
  }

}
