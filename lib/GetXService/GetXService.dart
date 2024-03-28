import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetXService/Service.dart";

/// GetxService :
/// Till now we have written the business Logic inside the GetxController and the controller is
/// automatically removed from the memory when it is not used. But suppose we want some functionalities
/// that should be available till the app is alive. In that particular case, we can not write the
/// business logic inside the controller class. Because when the controller is not used it will be
/// removed from the memory by the GetX System. But now we want the functionalities to be available till
/// the App is alive in that case we write the business logic inside the GetxService class.
///
/// GetxService is similar to GetxController with the same LifeCycle method like onInit(), onReady()
/// and onClose(). The Only difference is that GetxService notifies the GetX Dependency Injection System
/// that it should not be removed from the memory.
///
/// The only way to remove the GetxService from the Memory is to Close the Application OR
/// we need to manually call the method Get.reset().
///
/// Difference between GetxController and GetxService :
/// GetxService is similar to GetxController but the only difference is that GetxService will not be
/// removed from the memory.

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  print("Starting services...");
  await Get.putAsync<ServicesProvider>(() async { return ServicesProvider(); },);
  print("All services started...");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetXService",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const GetXService(),
    );
  }
}
class GetXService extends StatelessWidget
{
  const GetXService({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Service",
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
                Get.find<ServicesProvider>().incrementCounter();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text("Increment",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
