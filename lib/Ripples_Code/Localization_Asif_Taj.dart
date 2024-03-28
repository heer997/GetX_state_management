import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_state_management/Ripples_Code/languages.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Localization",
      debugShowCheckedModeBanner: false,
      locale: const Locale("en", "US"),
      translations: Languages(),
      fallbackLocale: const Locale("en", "US"),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetX Localization",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              "message".tr,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            subtitle: Text("name".tr),
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("en", "US"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "English",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("ur", "PK"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Urdu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("gu", "GJ"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Gujarati",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("hi", "HI"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Hindi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("pu", "PU"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Punjabi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("ml", "ML"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Malayalam",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("si", "SI"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Sindhi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("tm", "TM"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Tamil",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("gr", "GR"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "German",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("fr", "FR"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "French",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("jp", "JP"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Japanese",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    const Locale("rs", "RS"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Russian",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
