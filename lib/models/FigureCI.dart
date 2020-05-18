class FigureCI {
  final String pays;
  final String date_update;
  final String cas_confirme;
  final String cas_deces;
  final String cas_gueri;
  final int cas_actif;
  final String nombre_prelevement;
  final int nouveau_cas_confirme;
  final int nouveau_cas_deces;
  final int nouveau_cas_gueri;
  final int nouveau_nombre_prelevement;


  FigureCI({this.pays, this.date_update, this.cas_confirme, this.cas_deces, this.cas_gueri, this.cas_actif, this.nombre_prelevement, this.nouveau_cas_confirme, this.nouveau_cas_deces, this.nouveau_cas_gueri, this.nouveau_nombre_prelevement});

  factory FigureCI.fromJson(Map<String, dynamic> json) {
    return FigureCI(
      pays: json['pays'],
      date_update: json['date_update'],
      cas_confirme: json['cas_confirme'],
      cas_deces: json['cas_deces'],
      cas_gueri: json['cas_gueri'],
      cas_actif: json['cas_actif'],
      nombre_prelevement: json['nombre_prelevement'],
      nouveau_cas_confirme: json['nouveau_cas_confirme'],
      nouveau_cas_deces: json['nouveau_cas_deces'],
      nouveau_cas_gueri: json['nouveau_cas_gueri'],
      nouveau_nombre_prelevement: json['nouveau_nombre_prelevement'],
    );
  }
}