import 'package:cantina_app/src/pages/base/base_screen.dart';
import 'package:cantina_app/src/routes/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: "Cantina Vendas",
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white.withAlpha(200)
      ),
      debugShowCheckedModeBanner: false,
      home: const BaseScreen(),
      getPages: AppPages.pages,
    );
  }
}