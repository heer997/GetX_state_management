import "package:flutter/material.dart";
import "package:get/get.dart";

class MyListController2 extends GetxController
{
  var items = [].obs;
  var cartItems = [].obs;

  void addItems(String newItem)
  {
    items.add(newItem);
  }
  void addToCart(int index)
  {
    cartItems.add(items[index]);
  }

  void showAddItemDialog()
  {
    TextEditingController textController = TextEditingController();
    Get.defaultDialog(
      title: "Add Data",
      content: SizedBox(
        width: 300.0,
        child: TextFormField(
          controller: textController,
          maxLines: 1,
          maxLength: 100,
          decoration: const InputDecoration(
            hintText: "Enter the data",
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            String newItem = textController.text;
            if(newItem.isNotEmpty)
              {
                addItems(newItem);
              }
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text("Add",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text("Cancel",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}