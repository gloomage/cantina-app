import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ParcModel{
  String? id;
  String? nomparc;
  String? emlparc;
  String? cepparc;
  String? casparc;
  String? telparc;
  String? sttparc;
  String? cpfparc;
  String? cnpparc;
  double? vlcparc;
  double? vldparc;

  ParcModel({
    this.id,
    this.nomparc,
    this.emlparc,
    this.cepparc,
    this.casparc,
    this.telparc,
    this.sttparc,
    this.cpfparc,
    this.cnpparc,
    this.vlcparc,
    this.vldparc,
  });
}