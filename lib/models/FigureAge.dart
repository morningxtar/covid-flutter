class FigureAge {
  final String pays;
  final String nbre_0_30;
  final String pourc_nbre_0_30;
  final String nbre_31_50;
  final String pourc_nbre_31_50;
  final String nbre_51_plus;
  final String pourc_nbre_51_plus;


  FigureAge({this.pays, this.nbre_0_30, this.pourc_nbre_0_30, this.nbre_31_50, this.pourc_nbre_31_50, this.nbre_51_plus, this.pourc_nbre_51_plus});

  factory FigureAge.fromJson(Map<String, dynamic> json) {
    return FigureAge(
      pays: json['pays'],
      nbre_0_30: json['nbre_0_30'],
      pourc_nbre_0_30: json['pourc_nbre_0_30'],
      nbre_31_50: json['nbre_31_50'],
      pourc_nbre_31_50: json['pourc_nbre_31_50'],
      nbre_51_plus: json['nbre_51_plus'],
      pourc_nbre_51_plus: json['pourc_nbre_51_plus'],
    );
  }
}