import "package:get/get.dart";

class FavouriteController extends GetxController {
  RxList<String> fruitList = [
    "Mango",
    "Orange",
    "Pineapple",
    "Watermelon",
    "Banana",
    "Strawberry",
    "Cherry",
    "Lemon",
    "BlackBerry",
    "Grape",
    "Papaya",
    "BlueBerry",
    "Pear",
    "Coconut",
    "Guava"
  ].obs;

  RxList favouriteList = [].obs;

  addToFavourite(String value) {
    favouriteList.add(value);
  }

  removeFromFavourite(String value) {
    favouriteList.remove(value);
  }
}
