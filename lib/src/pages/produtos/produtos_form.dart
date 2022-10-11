import 'package:cantina_app/src/models/prod_model.dart';
import 'package:cantina_app/src/repositories/prod_repository.dart';
import 'package:cantina_app/src/routes/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ProdutosForm extends StatefulWidget{
  const ProdutosForm({Key? key}) : super(key: key);

  @override
  State<ProdutosForm> createState() => _ProdutosForm();
}

class _ProdutosForm extends State<ProdutosForm>{
  ProdRepository prodRepository = new ProdRepository();
  ProdModel prodModel = new ProdModel();

  @override
  Widget build(BuildContext context){
    final dropValue = ValueNotifier('');
    final dropOpcoes = ['Comida', 'Bebida'];
  

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            const SizedBox(
              height: 30,
            ),

            //Voltar
            Row(
              children: [
                TextButton(
                  onPressed: (){
                    Get.toNamed(PagesRoutes.baseScreen);
                  }, 
                  child: const Icon(Icons.arrow_back_ios, color: Colors.purple,),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //Titulo
            Row(
              children: const [
                Text(
                  'Novo Produto',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),
          
            //Nome do produto
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome do Produto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onSaved: (newValue) {
                        prodModel.nomprod = newValue;
                      },
                    ),
                  ),
                )
              ],
            ),

            //Descrição do produto
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50,

                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Unidade de Medida',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onSaved: (newValue) {
                        prodModel.medprod = newValue;
                      },
                    ),
                  ),
                )
              ],
            ),

            //Preço e Quantidade
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, right: 5),
                    height: 50,

                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Preço',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onSaved: (newValue) {
                        prodModel.vlrprod = double.parse(newValue!);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 5),
                    height: 50,

                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onSaved: (newValue) {
                        prodModel.qntprod = int.parse(newValue!);
                      },
                    ),
                  ),
                ),
              ],
            ),

            //Dropdown da categoria e adicionar categoria
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, right: 5),
                    height: 50,

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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 5),
                  height: 50,
                  width: 130,

                  child: OutlinedButton(
                    onPressed: () {

                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.purple, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Add Categoria'),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50,

                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Descrição do Produto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onSaved: (newValue) {
                        prodModel.desprod = newValue;
                      },
                    ),
                  ),
                )
              ],
            ),

            //Rodape
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Expanded
                  Expanded(
                    //Container
                    child: Container(
                      margin: const EdgeInsets.only(top: 50, right: 5),
                      height: 50,

                      //Botão
                      child: ElevatedButton(
                        onPressed: () {
                          prodRepository.save(prodModel);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white, 
                          shadowColor: Colors.purpleAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50, left: 5),
                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {
                  
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white, 
                          shadowColor: Colors.purpleAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}