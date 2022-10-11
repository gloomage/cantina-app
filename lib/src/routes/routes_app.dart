import 'package:cantina_app/src/pages/base/base_screen.dart';
import 'package:cantina_app/src/pages/produtos/produtos_form.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.produtosForm, 
      page: () => const ProdutosForm(),
    ),
    GetPage(
      name: PagesRoutes.baseScreen,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String baseScreen = '/home';
  static const String produtosForm = '/produtos/form';
}