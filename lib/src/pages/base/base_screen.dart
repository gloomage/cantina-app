import 'package:cantina_app/src/pages/caixa/caixa_page.dart';
import 'package:cantina_app/src/pages/perfil/perfil_page.dart';
import 'package:cantina_app/src/pages/produtos/produtos_page.dart';
import 'package:cantina_app/src/pages/vendas/vendas_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BaseScreen extends StatefulWidget{
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState(); 
}

class _BaseScreenState extends State<BaseScreen>{
  int currentIndex = 0;
  final PageControlle = PageController();

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: PageView(
        controller: PageControlle,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          VendasPage(),
          ProdutosPage(),
          CaixaPage(),
          PerfilPage(),
        ],
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.purple,
            activeColor: Colors.purple,
            tabBackgroundColor: Colors.grey.withOpacity(0.5),
            gap: 8,
            
            onTabChange: (index){
              setState(() {
                currentIndex = index;
                //Passando de pagina
                PageControlle.animateToPage(
                index,
                duration: const Duration(microseconds: 700),
                curve: Curves.ease,
            );
              });
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.add_business,
                text: 'Vendas',
              ),
              GButton(
                icon: Icons.add_shopping_cart,
                text: 'Produtos',
              ),
              GButton(
                icon: Icons.business_center,
                text: 'Caixa',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}