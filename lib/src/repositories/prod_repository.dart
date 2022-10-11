import 'package:cantina_app/src/models/prod_model.dart';
import 'package:dio/dio.dart';

class ProdRepository{

  void getAll() async {
    try {
      var response = await Dio().get('http://192.168.1.141:8080/api/v1/publica/prod');
    } catch (e) {
      print(e);
    }
  }

  void save(ProdModel prodModel) async {
    var response = await Dio().post('http://192.168.1.141:8080/api/v1/publica/prod',data: prodModel.toJson());
  }
}