import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PerfilPage extends StatefulWidget{
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPage();
}

class _PerfilPage extends State<PerfilPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Center(
        child: Text("Perfil"),
      ),
      
    );
  }
}