import 'package:cantina_app/src/pages/base/base_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
   
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const BaseScreen(),
    ),

  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/home';
}
