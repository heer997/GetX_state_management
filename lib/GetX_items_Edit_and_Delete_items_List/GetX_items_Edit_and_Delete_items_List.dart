import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetX_items_Edit_and_Delete_items_List/MyController3.dart";

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Items Edit and Delete items from List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyListView3(),
    );
  }
}
class MyListView3 extends StatelessWidget
{
  MyListView3({super.key});

  final MyListController3 myController = Get.put(MyListController3());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Edit and delete from List"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: myController.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(myController.items[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(myController.items[index]),
                    trailing: ElevatedButton(
                      onPressed: () {
                        myController.addToCart(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Item Added"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: const Text("Add to Cart",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myController.showAddItemDialog();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 30.0),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() {
              return CartPage3();
            },);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text("View Cart",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
class CartPage3 extends StatelessWidget
{
  CartPage3({super.key});

  final MyListController3 myController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CART PAGE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: myController.cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(myController.cartItems[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(myController.cartItems[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            myController.cartItems.removeAt(index);
                          },
                          child: const Text("Delete",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showUpdateItemDialog(context, index);
                          },
                          child: const Text("Update",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },),
          ),
        ],
      ),
    );
  }

  void showUpdateItemDialog(BuildContext context, int index)
  {
    TextEditingController updateController = TextEditingController();

    updateController.text = myController.cartItems[index];

    Get.defaultDialog(
      title: "Update Item",
      content: SizedBox(
        width: 300.0,
        child: TextFormField(
          controller: updateController,
          maxLines: 1,
          maxLength: 100,
          decoration: const InputDecoration(
            hintText: "Enter the updated item name",
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            String updatedItem = updateController.text;
            if(updatedItem.isNotEmpty)
              {
                myController.cartItems[index] = updatedItem;
              }
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text("Update",
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