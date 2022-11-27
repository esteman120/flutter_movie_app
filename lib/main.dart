import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presenation/main_binding.dart';
import 'package:movie_app/presenation/routes/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: Routes.dashboard,
      getPages: NavigationPage.pages,
      initialBinding: MainBinding(),
    );
  }
}
