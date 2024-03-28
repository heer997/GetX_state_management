import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

Future<void> main() async {
  await GetStorage.init();

  /// Initialize the Storage Driver
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Get Storage GetX",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: StoragePractice(),
    );
  }
}

class StoragePractice extends StatelessWidget {
  StoragePractice({super.key});

  TextEditingController emailController = TextEditingController();
  var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetStorage and Email Validation"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.0,
              child: TextFormField(
                controller: emailController,
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                if (GetUtils.isEmail(emailController.text)) {
                  storage.write("Email", emailController.text);
                } else {
                  Get.snackbar(
                    "InCorrect Email",
                    "Provide Email in valid format",
                    colorText: Colors.white,
                    backgroundColor: Colors.red,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: const Size(300.0, 50.0),
              ),
              child: const Text(
                "Write",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                print("The Email is : ${storage.read("Email")}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: const Size(300.0, 50.0),
              ),
              child: const Text(
                "Read",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// GetStorage is used for persistent key/value storage
/// Can store String, int, double, Map and List
///
/// To listen for changes
/// var listen = storage.listen(() { print("Email Changed"); });
/// when subscribed to listen event it should be disposed by using storage.removeListen(listen);
/// To listen for changes in key storage.listenKey("email", (value) { print("New key is $value"); });
///
/// Remove a key
/// storage.remove("email");
///
/// erase the container
/// storage.erase();
///
/// create container with a name
/// GetStorage g = GetStorage("MyStorage");
/// await GetStorage.init("MyStorage"); // initialize
