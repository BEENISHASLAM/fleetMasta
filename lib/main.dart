import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolor.purple),
        useMaterial3: true,
      ),
      getPages: AppRouting.routes,
      initialRoute: '/welcomeScreen',
    );
  }
}
