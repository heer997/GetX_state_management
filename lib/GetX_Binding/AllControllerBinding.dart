import "package:get/get.dart";
import "package:getx_state_management/GetX_Binding/HomeController.dart";
import "package:getx_state_management/GetX_Binding/MyController3.dart";

class AllControllerBinding implements Bindings
{
  /// Whenever we implements the Bindings interface we need to override the dependencies method
  /// as shown below.
  /// Now we are not initializing the controller inside UI code this means our UI code is totally decoupled
  /// from the controller instance creation.

  @override
  void dependencies()
  {
    Get.lazyPut(() { return MyController3(); },);
    Get.lazyPut(() { return HomeController(); },);
  }
}