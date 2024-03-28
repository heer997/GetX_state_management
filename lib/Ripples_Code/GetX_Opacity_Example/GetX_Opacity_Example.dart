import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/Ripples_Code/GetX_Opacity_Example/opacityController.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Opacity Example",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const OpacityExample(),
    );
  }
}

class OpacityExample extends StatefulWidget {
  const OpacityExample({super.key});

  @override
  State<OpacityExample> createState() {
    return OpacityExampleState();
  }
}

class OpacityExampleState extends State<OpacityExample> {
  OpacityController opacityController = Get.put(OpacityController());

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opacity Example"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () {
              return Container(
                width: 200.0,
                height: 200.0,
                color:
                    Colors.brown.withOpacity(opacityController.opacity.value),
              );
            },
          ),
          const SizedBox(height: 50.0),
          Obx(
            () {
              return Slider(
                value: opacityController.opacity.value,
                onChanged: (value) {
                  opacityController.setOpacity(value);
                  print(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
