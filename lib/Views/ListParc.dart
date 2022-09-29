import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:cantina_app/Models/ParcModel.dart';

class ListParc extends StatefulWidget {
  const ListParc({Key? key}) : super(key: key);

  @override
  State<ListParc> createState() => _ListParcState();
}

class _ListParcState extends State<ListParc> {

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
                    subtitle: Text("exemplo@gmail.com")
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
    var url = Uri.parse("http://192.168.1.141:8080/parceiros"); //ip do wlp2s0 == ip do pc na lan
    var response = await http.get(url);

    if(response.statusCode == 200){

      List listaParceiros = jsonDecode(response.body);
      return listaParceiros.map((json) => ParcModel.fromJson(json)).toList();

    }else{
      throw Exception("Erro não foi possivel carregar os parceiros");
    }
  }
}