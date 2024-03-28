import "dart:io";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/Ripples_Code/GetX_Image_Picker/ImagePickerController.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Image Picker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const ImagePickerDemo(),
    );
  }
}

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() {
    return ImagePickerDemoState();
  }
}

class ImagePickerDemoState extends State<ImagePickerDemo> {
  ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? FileImage(File(controller.imagePath.toString()))
                        : null),
              ),
              const SizedBox(height: 40.0),
              Center(
                child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: controller.imagePath2.isNotEmpty
                        ? FileImage(File(controller.imagePath2.toString()))
                        : null),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  controller.getImage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(300.0, 50.0),
                ),
                child: const Text(
                  "Pick Image",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  controller.pickImage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(300.0, 50.0),
                ),
                child: const Text(
                  "Pick Image 2",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
