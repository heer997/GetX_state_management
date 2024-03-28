import "package:flutter/material.dart";
import "package:get/get.dart";

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
      title: "SnackBar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SnackBarDemo(),
    );
  }
}
class SnackBarDemo extends StatelessWidget
{
  const SnackBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar using GetX"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "SnackBar Title",
                  "SnackBar Subtitle, This will be SnackBar Message",
                  snackPosition: SnackPosition.BOTTOM,
                  // titleText: const Text("Another Title"),
                  // messageText: const Text("Another Message"),
                  colorText: Colors.blue,
                  backgroundColor: Colors.black,
                  borderRadius: 30.0,
                  margin: const EdgeInsets.all(10.0),
                  maxWidth: 300.0,
                  animationDuration: const Duration(seconds: 1),
                  /// Once we specified backgroundGradient, then backgroundColor have no Effect
                  backgroundGradient: const LinearGradient(
                    colors: [Colors.red, Colors.green],
                  ),
                  /// While using borderColor ensure you are using borderWidth otherwise error will be
                  /// generated
                  borderColor: Colors.purple,
                  borderWidth: 3,
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(30.0,50.0),
                      spreadRadius: 20.0,
                      blurRadius: 8.0,
                    ),
                  ],
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  forwardAnimationCurve: Curves.bounceInOut,
                  duration: const Duration(seconds: 2),
                  icon: const Icon(Icons.send, color: Colors.white),
                  /// To Stop the Icon Pulse, as shown below :
                  shouldIconPulse: false,
                  leftBarIndicatorColor: Colors.teal,
                );
              },
              child: const Text("Show SnackBar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}