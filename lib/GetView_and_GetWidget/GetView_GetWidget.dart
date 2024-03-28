import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetView_and_GetWidget/countController.dart";

/// When to use GetView and GetWidget ?
/// Suppose, we have one View or we have a screen and that View or Screen is dependent on a single
/// controller then instead of extending a StatelessWidget, We can extend GetView OR GetWidget.
/// GetView OR GetWidget are similar but only with a small difference.
/// The only difference between GetView and GetWidget is that GetWidget will give the same instance of
/// the controller if it is created with the help of Get.create().

/// GetView :
/// ==========
/// If we have a single controller as a dependency then we can use GetView instead of StatelessWidget
/// and avoid writing Get.find
/// Whenever we are using the GetView, automatically GetView will give the instance of CountController
/// (as shown below) and the name of the instance will be "controller".
/// Whenever the GetView is giving the instance of the CountController(as shown below), the instance is
/// same that's why the hashCode is also Same
///
/// GetWidget :
/// ============
/// It is similar to GetView with one difference it gives the same instance of Get.find everytime.
/// It becomes very useful when used in combination with Get.create.(This means Whenever we are using
/// GetWidget at that time this GetWidget will give the same instance of the CountController(as shown below)).
///
/// Get.create() :
/// In Get.create(), here isSingletone property is false this means that Get.create() will create
/// different different instances of CountController(as shown below, we can check in console).
/// Since it is creating different different instances, the Text() widget is also not updated.
/// If we want that Get.create() give us same instance of CountController(as shown below) then instead of
/// using GetView, we can use GetWidget

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
      title: "GetView and GetWidget",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const GetPractice(),
    );
  }
}
class GetPractice extends GetView<CountController>
{
  const GetPractice({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    // Get.create(() {
    //   return CountController();
    // },);
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetView and GetWidget",
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
              return Text("The value is : ${controller.count}",
                style: const TextStyle(fontSize: 30.0),
              );
            },),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                print(controller.hashCode);
                controller.increment();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: const Size(300.0, 50.0),
              ),
              child: const Text("Increment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}