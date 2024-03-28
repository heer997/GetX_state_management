import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/Ripples_Code/Mark_Favourite_App/favouriteController.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Mark Favourite App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MarkFavouriteApp(),
    );
  }
}

class MarkFavouriteApp extends StatefulWidget {
  const MarkFavouriteApp({super.key});

  @override
  State<MarkFavouriteApp> createState() {
    return MarkFavouriteAppState();
  }
}

class MarkFavouriteAppState extends State<MarkFavouriteApp> {
  FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mark Favourite App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: controller.fruitList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(controller.fruitList[index].toString()),
              trailing: Obx(
                () {
                  return Icon(Icons.favorite,
                      color: controller.favouriteList
                              .contains(controller.fruitList[index].toString())
                          ? Colors.red
                          : Colors.white);
                },
              ),
              onTap: () {
                if (controller.favouriteList
                    .contains(controller.fruitList[index].toString())) {
                  controller.removeFromFavourite(
                      controller.fruitList[index].toString());
                } else {
                  controller
                      .addToFavourite(controller.fruitList[index].toString());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
