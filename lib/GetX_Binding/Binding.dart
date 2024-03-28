import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetX_Binding/AllControllerBinding.dart";
import "package:getx_state_management/GetX_Binding/Home.dart";
import "package:getx_state_management/GetX_Binding/HomeController.dart";
import "package:getx_state_management/GetX_Binding/HomeControllerBinding.dart";
import "package:getx_state_management/GetX_Binding/MyAppControllerBinding.dart";
import "package:getx_state_management/GetX_Binding/MyController3.dart";

/// GetX Binding :
/// We write the business logic inside the GetxController class. After that we create the instance of the
/// controller inside out UI code and after creating an instance we use variables and methods of that
/// particular controller. This means that out UI code is tightly coupled with the controller. Because the
/// instances created inside UI code.
///
/// Now If we want to remove this tight coupling then we use Binding. This means if we use Binding then there
/// is no need to create controller instance inside UI code.

/// Smart Management :
/// GetX provides SmartManagement that lets us configure how dependencies behave in terms of memory
/// management.
/// GetMaterialApp {
/// smartManagement: SmartManagement.full // or .keepFactory or .onlyBuilder
/// }
/// Full mode
/// ==============
/// Everything gets disposed as soon as the route is removed from navigation stack, unless declared permanent.
///
/// SmartManagement.keepFactory
/// =====================================
/// Just like SmartManagement.full, it will remove it's dependencies when
/// it's not being used anymore. However, it will keep their factory,
/// which means it will recreate the dependency if you need that instance again.
///
/// SmartManagement.onlyBuilders
/// =====================================
/// With this option, only controllers started in init: or loaded into a Binding with Get.lazyPut() will
/// be disposed.
///
/// If you use Get.put() or Get.putAsync() or any other approach,
/// SmartManagement will not have permissions to exclude this dependency.


void main() {
  MyAppControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Binding",
      debugShowCheckedModeBanner: false,
      // initialBinding: AllControllerBinding(),

      /// If binding applied at route level
      /// If we are implementing the Binding at route level, there is no need to initialize
      /// at beginning "initialBinding" above.
      getPages: [
        GetPage(
          name: "/home",
          page: () {
            return Home();
          },
          binding: HomeControllerBinding(),
        ),
      ],


      /// Binding Builder (If we don't want to use separate binding class)
      /// Below this BindingsBuilder is useful if you don't want to create separate binding class.
      // getPages: [
      //   GetPage(
      //     name: "/home",
      //     page: () { return Home(); },
      //     binding: BindingsBuilder(() {
      //       Get.lazyPut<HomeControllerBinding>(() {
      //         return HomeControllerBinding();
      //       },);
      //     },),
      //   ),
      // ],

      home: BindingPractice(),
    );
  }
}

class BindingPractice extends StatelessWidget {
  const BindingPractice({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Binding Practice",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return Text(
                  "The value is ${Get.find<MyController3>().count}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30.0),
                );
              },
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Get.find<MyController3>().increment();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Increment",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Get.to(
                //   () {
                //     return Home();
                //   },
                // );

                /// For Named route
                Get.toNamed("/home");

                /// For Normal routes, if you want to initialize the binding at that time when you are
                /// calling the route then we can use as shown below
                // Get.to(() {
                //   return Home();
                // },
                //   binding: HomeControllerBinding(),
                // );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Home",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
