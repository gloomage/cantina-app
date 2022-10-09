import 'package:cantina_app/src/pages/produtos/produtos_form.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget{
  const ProdutosPage({Key? key}) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPage();
}

class _ProdutosPage extends State<ProdutosPage>{

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
              margin: EdgeInsets.only(top: 20, bottom: 20),

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
                                const ProdutosForm();
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
                                borderRadius: BorderRadius.circular(8),
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

            // Tabela
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[

                      //3ª Linha -> Referente a tabela
                      Container(
                        margin: const EdgeInsets.only(top: 10),

                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SingleChildScrollView(
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text('Produto')),
                                    DataColumn(label: Text('Price')),
                                    DataColumn(label: Text('Quant.')),
                                    DataColumn(label: Text('Categoria')),
                                  ],
                                  rows: const [
                                    DataRow(cells: [
                                      DataCell(Text('Pastel')),
                                      DataCell(Text('4,50')),
                                      DataCell(Text('14')),
                                      DataCell(Text('Comida'))
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Refri')),
                                      DataCell(Text('3,50')),
                                      DataCell(Text('34')),
                                      DataCell(Text('Bebida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Sanduiche')),
                                      DataCell(Text('5,50')),
                                      DataCell(Text('7')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Esfira')),
                                      DataCell(Text('5,00')),
                                      DataCell(Text('17')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Pão de Queijo')),
                                      DataCell(Text('0,50')),
                                      DataCell(Text('45')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Suco')),
                                      DataCell(Text('2,50')),
                                      DataCell(Text('23')),
                                      DataCell(Text('Comida')),
                                    ]),
                              
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),  
    );

  }
}