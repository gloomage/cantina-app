import 'package:cantina_app/src/constants/endpoints.dart';
import 'package:cantina_app/src/models/prod_model.dart';
import 'package:cantina_app/src/services/http_maneger.dart';
import 'package:dio/dio.dart';

class ProdRepository {
  final HttpManager _httpManager = HttpManager();

  Future<List<ProdModel>> getAll() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.produto,
      method: HttpMethods.get,
    );
    
    if (result.data.isNotEmpty) {
      List<ProdModel> listProdutos =
          (result.data as List).map((e) => ProdModel.fromJson(e)).toList();
      return listProdutos;
    } else {
      return Future.error("Error! Retorno vazio");
    }
  }

  Future<bool> save(ProdModel prodModel) async {

    print(prodModel.nomprod);

    final result = await _httpManager.restRequest(
      url: Endpoints.produto,
      method: HttpMethods.post,
      body: prodModel.toJson(),
    );

    print(result);

    if (true) {
      return true;
    } else {
      return false;
    }
  }
}
