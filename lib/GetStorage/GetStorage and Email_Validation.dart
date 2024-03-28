import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

/// Here below is GetStorage and Email Validation is performed. If the Email is correct then the
/// Snackbar with valid message will be shown otherwise Snackbar with Invalid message will be
/// shown. After pressing on the "WRITE" button, TextFormField value will be saved in the variable "name"
/// as shown below. After pressing on the "READ" button, TextFormField value(Valid value) will be updated
/// in the UI as shown below.

Future<void> main() async {
  /// Initialize get storage before app run
  await GetStorage.init();

  ///  Initialize Storage driver
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Get Storage and Email Validation",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const EmailValidation(),
    );
  }
}

class EmailValidation extends StatefulWidget {
  const EmailValidation({super.key});

  @override
  State<EmailValidation> createState() => _EmailValidationState();
}

class _EmailValidationState extends State<EmailValidation> {
  TextEditingController emailController = TextEditingController();

  var box = GetStorage();

  var name = "12345678910";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Storage and Email Validation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  if (GetUtils.isEmail(emailController.text)) {
                    box.write("keyName", emailController.text);
                    Get.snackbar(
                      "saved",
                      "data saved successfully",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      "Invalid Email",
                      "Email is incorrect",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(300.0, 50.0),
                ),
                child: const Text(
                  "WRITE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      name = box.read("keyName");
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(300.0, 50.0),
                ),
                child: const Text(
                  "READ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}