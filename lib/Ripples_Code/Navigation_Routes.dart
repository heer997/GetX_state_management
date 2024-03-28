import "package:flutter/material.dart";
import "package:get/get.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Navigation Routes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HeightWidth(),
    );
  }
}

class HeightWidth extends StatefulWidget {
  const HeightWidth({super.key});

  @override
  State<HeightWidth> createState() {
    return HeightWidthState();
  }
}

class HeightWidthState extends State<HeightWidth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Height and Width using GetX",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * .6,
            width: Get.width * .5,
            color: Colors.teal,
            child: const Center(
              child: Text(
                "Center",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
            ),
          ),
          Container(
            height: Get.height * .2,
            width: Get.width * .5,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Center",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
