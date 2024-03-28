import "package:get/get.dart";
import "package:getx_state_management/GetX_Binding/HomeController.dart";

class HomeControllerBinding implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    },);
  }
}