import "package:flutter/material.dart";
import "package:get/get.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Themes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const ThemesDemo(),
    );
  }
}

class ThemesDemo extends StatefulWidget {
  const ThemesDemo({super.key});

  @override
  State<ThemesDemo> createState() {
    return ThemesDemoState();
  }
}

class ThemesDemoState extends State<ThemesDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetX Themes Change",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("GetX bottom Sheet"),
              subtitle: Text("GetX bottom Sheet Show"),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              const Icon(Icons.light_mode, color: Colors.black),
                          title: const Text(
                            "Light Theme",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.dark_mode, color: Colors.black),
                          title: const Text(
                            "Dark Theme",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
