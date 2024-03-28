import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetX_Items_add_in_List/Controller_class.dart";

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Items add in the List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyListView(),
    );
  }
}
class MyListView extends StatelessWidget
{
  MyListView({super.key});

  final MyListController controller = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView with GetX"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        child: Text(controller.items[index][0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(controller.items[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(controller.items[index]),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check_box),
                      ),
                    ),
                  );
                },
              );
            },),
          ),
          ElevatedButton(
            onPressed: () {
              controller.showAddItemDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text("Add Item",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
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