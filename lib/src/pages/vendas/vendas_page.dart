import 'dart:convert';
import 'dart:html';

import 'package:cantina_app/src/models/prod_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VendasPage extends StatefulWidget{
  const VendasPage({Key? key}) : super(key: key);

  @override
  State<VendasPage> createState() => _VendasPage();
}

class _VendasPage extends State<VendasPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body:Container(
        child: Text('VENDA'),
      )

    );

    
  }
}