class FigureGlobals {
  final String entite;
  final String date_update;
  final String cas_confirme;
  final String cas_deces;
  final String cas_gueri;
  final String taux_deces;
  final String taux_gueri;
  final String nombre_prelevement;

  List<FigureGlobals> figuresGlobal =[];


  FigureGlobals({
      this.entite,
      this.date_update,
      this.cas_confirme,
      this.cas_deces,
      this.cas_gueri,
      this.taux_deces,
      this.taux_gueri,
      this.nombre_prelevement});

  factory FigureGlobals.fromJson(Map<String, dynamic> json) {
    return FigureGlobals(
      entite: json['entite'],
      date_update: json['date_update'],
      cas_confirme: json['cas_confirme'],
      cas_deces: json['cas_deces'],
      cas_gueri: json['cas_gueri'],
      taux_deces: json['taux_deces'],
      taux_gueri: json['taux_gueri'],
      nombre_prelevement: json['nombre_prelevement'],
    );
  }
}