class ParcModel {
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

  ParcModel(
      {this.id,
      this.nomparc,
      this.emlparc,
      this.cepparc,
      this.casparc,
      this.telparc,
      this.sttparc,
      this.cpfparc,
      this.cnpparc,
      this.vlcparc,
      this.vldparc});

  ParcModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomparc = json['nomparc'];
    emlparc = json['emlparc'];
    cepparc = json['cepparc'];
    casparc = json['casparc'];
    telparc = json['telparc'];
    sttparc = json['sttparc'];
    cpfparc = json['cpfparc'];
    cnpparc = json['cnpparc'];
    vlcparc = json['vlcparc'];
    vldparc = json['vldparc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomparc'] = this.nomparc;
    data['emlparc'] = this.emlparc;
    data['cepparc'] = this.cepparc;
    data['casparc'] = this.casparc;
    data['telparc'] = this.telparc;
    data['sttparc'] = this.sttparc;
    data['cpfparc'] = this.cpfparc;
    data['cnpparc'] = this.cnpparc;
    data['vlcparc'] = this.vlcparc;
    data['vldparc'] = this.vldparc;
    return data;
  }
}