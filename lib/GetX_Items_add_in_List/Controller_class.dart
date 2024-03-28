import "package:flutter/material.dart";
import "package:get/get.dart";

class MyListController extends GetxController
{
  var items = [].obs;

  void addItem(String newItem)
  {
    items.add(newItem);
  }
  void showAddItemDialog()
  {
    TextEditingController textController = TextEditingController();

    Get.defaultDialog(
      title: "Add Item",
      content: TextFormField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: "Enter item name",
        ),
      ),
      actions: <Widget>[
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
        ElevatedButton(
          onPressed: () {
            String newItem = textController.text;
            if(newItem.isNotEmpty)
              {
                addItem(newItem);
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
      ],
    );
  }
}