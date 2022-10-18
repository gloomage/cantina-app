import 'dart:convert';
import 'package:cantina_app/src/models/prod_model.dart';
import 'package:cantina_app/src/repositories/prod_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VendasPage extends StatefulWidget{
  const VendasPage({Key? key}) : super(key: key);

  @override
  State<VendasPage> createState() => _VendasPage();
}

class _VendasPage extends State<VendasPage>{
  final TextEditingController _controladorCaixa = TextEditingController();
  

  final ProdRepository prodRepository = ProdRepository();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body:Form(

        key: _formKey,

        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _controladorCaixa,
              ),
              
              OutlinedButton(
                onPressed: (){

                  if (_formKey.currentState!.validate()) {
                  
                    print("Cavalooo, o bagui foi");
                    String caixa = _controladorCaixa.text;
                    print(caixa);
                  }

                },
                child: Text("Cavalo") 
              ),
            ],
          ),
        )
      )

    );

    
  }
}