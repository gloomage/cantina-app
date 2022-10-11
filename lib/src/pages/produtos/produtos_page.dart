import 'dart:convert';

import 'package:cantina_app/src/models/prod_model.dart';
import 'package:cantina_app/src/routes/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProdutosPage extends StatefulWidget{
  const ProdutosPage({Key? key}) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPage();
}

class _ProdutosPage extends State<ProdutosPage>{

  late Future<List<ProdModel>> produtos;

  @override
  void initState(){
    super.initState();
    produtos = pegarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final dropOpcoes = ['Comida', 'Bebida'];

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [

            //Top
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),

              child: Column(
                children: <Widget>[

                  //1ª linha -> Referente ao textfield e o dropdown
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 20),

                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 15,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Pesquisar Produto',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Flexible(
                          flex: 8,
                          child: DropdownButtonFormField<String>(
                            items: dropOpcoes.map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e)),
                            ).toList(), 
                            onChanged: (escolha) => dropValue.value = escolha.toString(),
                            isExpanded: true,
                            decoration: InputDecoration(
                              label: const Text('Categoria'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),            
                            ),
                          ),      
                        ),
                      ],
                    ),
                  ),

                  //2ª Linha -> Referente ao botões Adicionar / Editar / Excluir
                  Container(
                    margin: const EdgeInsets.only(top: 10),

                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 10,

                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.toNamed(PagesRoutes.produtosForm);                              
                            },
                            icon: const Icon(Icons.add, size: 18,),
                            label: const Text('Adicionar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white, 
                              shadowColor: Colors.purpleAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(150, 40),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(   
                          flex: 10,

                          child: ElevatedButton.icon(
                            onPressed: () {
                              
                            },
                            icon: const Icon(Icons.edit, size: 18,),
                            label: const Text('Editar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white, 
                              shadowColor: Colors.purpleAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(150, 40),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 10,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              
                            },
                            icon: const Icon(Icons.delete, size: 18,),
                            label: const Text('Excluir'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white, 
                              shadowColor: Colors.purpleAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(150, 40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              )
            ),

            
      

            //Tabela
            Expanded(
              child: Container(
                width: double.infinity,
                
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(30),
                ),
            
                child: Column(
                  children: [
          
                    // Head
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                      // color: Colors.red,
                      width: double.infinity,
                      child: const Text(
                        'PRODUTOS',
                        textAlign: TextAlign.left,
                        

                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,

                        ),
                      ),
                    ),
            
                    
                    //Body
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          color: Colors.white,
                          child: FutureBuilder<List<ProdModel>>(
                          future: produtos,
                          builder: (context, snapshot){
                                      
                            if(snapshot.hasData){
                                      
                              List<ProdModel>? data = snapshot.data;
                                      
                              return DataTable(
                                          
                                horizontalMargin: 14,
                                          
                                columns: const [
                                  DataColumn(label: Text('Produto')),
                                  DataColumn(label: Text('Preço')),
                                  DataColumn(label: Text('Quant.')),
                                  DataColumn(label: Text('Medida')),
                                ],
                                      
                                rows: data!
                                .map(
                                  (produto) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(produto.nomprod!),
                                      ),
                                      DataCell(
                                        Text(produto.vlrprod!.toString()),
                                      ),
                                      DataCell(
                                        Text(produto.qntprod!.toString())
                                      ),
                                      DataCell(
                                        Text(produto.medprod!)
                                      ),
                                    ]
                                  )
                                )
                                .toList(),
                              );
                                      
                                      
                                      
                            }else if(snapshot.hasError){
                              return Text(snapshot.error.toString());
                            }
                            // return const CircularProgressIndicator();
                            return const LinearProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Color.fromARGB(255, 224, 222, 222),
                            );
                            // return const RefreshProgressIndicator();
                          },
                        ),
                          
                        ),
                      ),
                    ),
            
                    //Bottom
                    Container(
                    height: 40,
                    ),
            
                  ],
                ),
              ),
            ),
          ],
        ),
      ),  
    );
  }

  //Mover para um controller do produto 
  Future<List<ProdModel>> pegarProdutos() async {
    var url = Uri.parse("http://192.168.180.199:8080/api/v1/publica/prod"); //corrigir endereço para o ipv4 da maquina host
    var response = await http.get(url);

    if(response.statusCode == 200){

      List listaProdutos = jsonDecode(response.body);
      return listaProdutos.map((json) => ProdModel.fromJson(json)).toList();

    }else{
      throw Exception("Erro não foi possivel carregar os parceiros");
    }
  }

}