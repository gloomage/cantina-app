import 'package:cantina_app/src/config/custom_colors.dart';
import 'package:cantina_app/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: "Cantina Vendas",
      theme: ThemeData(
        primaryColor: CustomColors.customSwatchColor,
        scaffoldBackgroundColor: Colors.white.withAlpha(200)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.baseRoute,
      getPages: AppPages.pages,
    );
  }
}