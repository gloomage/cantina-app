class ProdModel {
  String? id;
  String? nomprod;
  String? medprod;
  String? desprod;
  double? vlrprod;
  int? qntprod;

  ProdModel({
    this.id,
    this.nomprod,
    this.medprod,
    this.desprod,
    this.vlrprod,
    this.qntprod
  });

  ProdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomprod = json['nomprod'];
    medprod = json['medprod'];
    desprod = json['desprod'];
    vlrprod = json['vlrprod'];
    qntprod = json['qntprod'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['nomprod'] = this.nomprod;
    data['medprod'] = this.medprod;
    data['desprod'] = this.desprod;
    data['vlrprod'] = this.vlrprod;
    data['qntprod'] = this.qntprod;
 
    return data;
  }
}