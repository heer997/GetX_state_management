import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetX_Workers/myController.dart";

/// Workers :
/// Workers generates specific callbacks whenever an event occurs. Different type of workers are there like
/// ever, everAll, once, debounce, interval
/// Best place to use workers is inside the onInit method (In Controller Class).

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Getx Workers",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: WorkersPractice(),
    );
  }
}

class WorkersPractice extends StatelessWidget {
  WorkersPractice({super.key});

  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetX Workers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                myController.incrementCounter();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: const Size(200.0, 50.0),
              ),
              child: const Text(
                "Increment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
              ),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: 300.0,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                ),
                onChanged: (value) {
                  myController.incrementCounter();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
