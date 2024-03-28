import "package:get/get.dart";
import "package:getx_state_management/GetX_Binding/MyController3.dart";

class MyAppControllerBinding implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut<MyController3>(() {
      return MyController3();
    },);
  }
}