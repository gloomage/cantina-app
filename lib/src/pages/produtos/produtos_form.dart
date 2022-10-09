import 'package:flutter/material.dart';

class ProdutosForm extends StatefulWidget{
  const ProdutosForm({Key? key}) : super(key: key);

  @override
  State<ProdutosForm> createState() => _ProdutosForm();
}

class _ProdutosForm extends State<ProdutosForm>{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),

      body: Column(
        children: [
          //Nome -> 
          TextFormField(

          ),

          //Price
          TextFormField(

          ),

          //Quant
          
          //Categoria
        ],
      ),
    );
  }
}