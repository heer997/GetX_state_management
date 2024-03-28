import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetX_Binding/HomeController.dart";

class Home extends StatelessWidget
{
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text("The value is ${Get.find<HomeController>().count}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              );
            },),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Get.find<HomeController>().increment();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text("Increment",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text("Back",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}