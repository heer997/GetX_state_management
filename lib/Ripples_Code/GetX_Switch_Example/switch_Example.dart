import "package:flutter/material.dart";
import "package:getx_state_management/Ripples_Code/GetX_Switch_Example/switchController.dart";
import "package:get/get.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Switch Example",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SwitchDemo(),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() {
    return SwitchDemoState();
  }
}

class SwitchDemoState extends State<SwitchDemo> {
  SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Switch Notification",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Obx(
                () {
                  return Switch(
                    value: switchController.notification.value,
                    onChanged: (value) {
                      switchController.notification.value = value;
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
