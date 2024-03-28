import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/GetX_Unique_ID/uniqueid_controller.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Unique ID",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: UniqueID(),
    );
  }
}

class UniqueID extends StatelessWidget {
  UniqueID({super.key});

  UniqueController myController = Get.put(UniqueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unique ID GetX"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<UniqueController>(
              id: "txtCount",
              builder: (controller) {
                /// Value of this Text Widget will be updated
                return Text(
                  "The value is ${controller.count}",
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                );
              },
            ),
            GetBuilder<UniqueController>(
              builder: (controller) {
                /// Value of this Text Widget will not be updated
                return Text(
                  "The value is ${controller.count}",
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 40.0),

            /// Whenever click on this particular button, it will only update that Text Widget which is
            /// under the GetBuilder having the "id" is "txtCount" as shown above.

            ElevatedButton(
              onPressed: () {
                return myController.increment();
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
          ],
        ),
      ),
    );
  }
}
