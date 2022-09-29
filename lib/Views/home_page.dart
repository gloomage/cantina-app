import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:cantina_app/Models/ParcModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<ParcModel>> parceiros;

  @override
  void initState(){
    super.initState();
    parceiros = pegarParceiros();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Parceiros"),
      ),
      body: Center(
        child: FutureBuilder<List<ParcModel>>(

          future: parceiros,
          builder: (context, snapshot){

            if(snapshot.hasData){
              
              return ListView.builder( 
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  ParcModel parcModel = snapshot.data![index];
                  return ListTile(
                    title: Text(parcModel.nomparc!),
                  );
                });

            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List<ParcModel>> pegarParceiros() async {
    var url = Uri.parse("http://172.18.0.1:8080/parceiros"); //corrigir endereço para o ipv4 da maquina host
    var response = await http.get(url);

    if(response.statusCode == 200){

      List listaParceiros = jsonDecode(response.body);
      return listaParceiros.map((json) => ParcModel.fromJson(json)).toList();

    }else{
      throw Exception("Erro não foi possivel carregar os parceiros");
    }
  }
}