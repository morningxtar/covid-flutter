class Figures {
  final String localite;
  final String commune;
  final String x;
  final String y;
  final String nbre_cas;


  Figures({
      this.localite,
      this.commune,
      this.x,
      this.y,
      this.nbre_cas,
      });

  factory Figures.fromJson(Map<String, dynamic> json) {
    return Figures(
      localite: json['localite'],
      commune: json['commune'],
      x: json['x'],
      y: json['y'],
      nbre_cas: json['nbre_cas'],
    );
  }
}