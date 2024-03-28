// You can use GetBuilder, GetX, or Obx in different situations during Flutter app development:
//
// GetBuilder: You can use GetBuilder when you want to update only a small portion of
// your widget's view based on specific state changes.
// For example, if you have multiple states managed within a controller and only want to update
// a few widgets that depend on those states, you can use GetBuilder to build those specific widgets.
//
// GetX: GetX combines the features of GetBuilder, Obx, and other functionalities provided by GetX.
// You can use GetX when you want to observe state changes and automatically update
// the widgets that depend on them. GetX performs better as it only updates the necessary widgets.
//
// Obx: Obx stands for "Observer Widget". You can use Obx when you want to update all the widgets
// associated with the observed state. Obx will automatically rebuild the widget
// whenever there is a change in the observed state. This is useful when you have multiple widgets
// depending on several states and you want to ensure that all those widgets are always updated
// according to the state changes.
//
// The choice between GetBuilder, GetX, or Obx depends on your needs and
// the complexity of your application. If you only need to update a small portion of your widgets,
// GetBuilder can be a good choice. If you want to automatically update widgets based on state changes,
// GetX or Obx can be better options.

///Simply:
//
// use GetBuilder when you want to update the state of a widget manually from your controller,
// with update(),
//
// use Obx, when you want to update a widget based on the value of an observable variable .obs,
// so whenever you change its value, the Obx will update automatically in your app.
//
// use Getx when you want to update a specific Widget with an id as an example automatically,
// you can think of it like GetBuilder but with Obx observation
//
// but consider using them carefully, because based on the docs,
// the Getbuilder consumes fewer resources so it has better performance, and
// Obx is based on streams so it consumes more resources.

/// GetView :
//If we have a view/screen and it is dependent only on one controller then instead of
//extending StatelessWidget , we can extend GetView and automatically we will have the instance
//of that controller on which view is dependent without using Get.

/// GetWidget :
//It is similar to GetView with one small difference, it gives the same instance of the controller
//every time and hence is very useful when used in combination with Get.create.

///Do remember Obx() only works with the variable of obs type.
///If your widget contains obs and non obs type variable together,
///then your Obx() won't be reactive, meaning it won't update the value as you expect.

///If you did not use obs then you should GetBuilder around your widget
///to get access to the controller variable

///Getx make variables observable
// final name = ''.obs;
// final isLogged = false.obs;
// final count = 0.obs;
// final balance = 0.0.obs;
// final number = 0.obs;
// These are some of the ways, you can declare observable variables in Getx.
// But if you don't want to use obs end of the variable then you can update() method.

///It's pretty easy to add two variables. In case, you add two obs type variable you can do like below
//
/// int get sum=>count.value+newCount.value;
// obs type variables setting or getting values is always done with .value;

///Getx make Lists observable
// To make a flutter list observable you need to add the obs word with the list.
// You need to declare a list variable first.
// There are three different ways you can do it.
/// var myList = [].obs;
/// var myList=<Model>[].obs
/// RxList<Model> myList=<Model>[].obs

/// Getx refresh a list
// If you add things dynamically or remove or update, you might not get new value immediately without refreshing the list.
// To get the most recent value from the list, you need to refresh the list to get updated value. You can do like below
/// _taskController.myList.refresh();
// If you are updating list from the database, then you need to do query first, then replace the old list value
// with assignAll() function.
//
/// void getTasks(){
///     List<Map<String, dynamic>> lists= await db.query();
///     myList.assignAll(lists.map((e)=>Model.fromJson(e)).toList();
/// }
// You need to modify the above code based on your needs. But to replace the old values you must use assignAll() function.
// Also do remember that, if you use Get.back() to go another page and expect the new value in the list,
// you must call the above code before you use Get.back() to go back to another page.
/// You can do like this
// getTasks();
// Get.back();
// It will make sure, you get the most recently updated value in Getx List Flutter.

///Getx GetBuilder With ID
// We will see how to update a certain widget in flutter using Getx GetBuilder.
//
// Your certain controller could be used in many different places.
// And the same controller could be found in many different places.
//
// If you use GetBuilder for that controller in the UI, then
// when you trigger update using the update() method, controller would update the state in every Ui,
// that is using the certain controller.
//
// This operation is quite expensive and unnecessary. You may use ID with GetBuilder and
// the same ID should be mentioned in the update() method. Because update() takes a list of IDs as a string.

///shrinkWrap in ListView.builder
//Usually, a ListView, as well as GridView, PageView, and CustomScrollView try to fill all the
// available space given by the parent element, even when the list items would require less space.
// With shrinkWrap: true, you can change this behavior so that the ListView only occupies the space it needs.