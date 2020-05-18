class FigureSex {
  final String pays;
  final String pourc_nbre_masc;
  final String pourc_nbre_fem;


  FigureSex({
      this.pays,
      this.pourc_nbre_masc,
      this.pourc_nbre_fem,
      });

  factory FigureSex.fromJson(Map<String, dynamic> json) {
    return FigureSex(
      pays: json['pays'],
      pourc_nbre_masc: json['pourc_nbre_masc'],
      pourc_nbre_fem: json['pourc_nbre_fem'],
    );
  }
}