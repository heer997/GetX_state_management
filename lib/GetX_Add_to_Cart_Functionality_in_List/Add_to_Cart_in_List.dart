import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetX_Add_to_Cart_Functionality_in_List/MyController.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Add to Cart in List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyListView2(),
    );
  }
}

class MyListView2 extends StatelessWidget {
  MyListView2({super.key});

  final MyListController2 controller = Get.put(MyListController2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView with GetX",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          child: Text(
                            controller.items[index][0],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          controller.items[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(controller.items[index]),
                        trailing: ElevatedButton(
                          onPressed: () {
                            controller.addToCart(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${controller.items[index]} added to cart",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                duration: const Duration(seconds: 1),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              Get.to(
                () {
                  return CartPage();
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text(
              "View Cart",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.showAddItemDialog();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 30.0),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final MyListController2 controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items in Cart"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.grey.shade300,
            child: const Text(
              "Items in Cart",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          controller.cartItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdni.iconscout.com/illustration/free/thumb/"
                        "free-empty-cart-4085814-3385483.png?f=webp",
                        width: 200.0,
                        height: 200.0,
                      ),
                      const Text(
                        "Your Cart is Empty",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        "Explore products and shop your favourite items",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Obx(
                    () {
                      return ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                child: Text(
                                  controller.cartItems[index][0],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                controller.cartItems[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(controller.cartItems[index]),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      editData(context, index,
                                          controller.cartItems[index]);
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      deleteData(index);
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  /// DELETE METHOD TO DELETE THE ITEM FROM THE CART LIST ITEM
  void deleteData(int index) {
    Get.defaultDialog(
      title: "Confirm delete",
      content: const Text("Are you sure you want to delete data ?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${controller.cartItems[index]} deleted..."),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 1),
              ),
            );
            setState(
              () {
                controller.cartItems.removeAt(index);
              },
            );
            Get.back();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "delete",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  /// EDIT METHOD TO EDIT THE ITEM NAME FROM THE CART LIST ITEM
  void editData(BuildContext context, int index, String currentItem) {
    final TextEditingController editController =
        TextEditingController(text: currentItem);
    Get.defaultDialog(
      title: "Edit data",
      content: SizedBox(
        width: 300.0,
        child: TextFormField(
          controller: editController,
          maxLines: 1,
          maxLength: 100,
          decoration: const InputDecoration(
            hintText: "Edit the data",
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(
              () {
                controller.cartItems[index] = editController.text;
              },
            );
            Get.back();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "Update",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
