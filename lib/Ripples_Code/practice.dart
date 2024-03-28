import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/Ripples_Code/controller.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Counter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatelessWidget {
  CounterApp({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("counter Application"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                print("Obx");
                return Text(
                  controller.counter.toString(),
                  style: const TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.increment();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, size: 30.0, color: Colors.white),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              controller.decrement();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.remove, size: 20.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
