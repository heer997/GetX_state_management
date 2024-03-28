import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

/// GetxService class is like a GetxController.
/// GetxService class shares the same lifecycle ( onInit(), onReady(), onClose() ).
/// GetxService class just notifies GetX Dependency Injection System,
/// that this subclass can not be removed from memory.
/// Generally, To create the controller, we extends the class by GetxController but
/// To create the service, we need to extends the GetxService class as shown below.
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

class ServicesProvider extends GetxService
{
  Future<void> incrementCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt("counter") ?? 0) + 1;
    print("Pressed $counter times.");
    await preferences.setInt("counter", counter);
  }
}