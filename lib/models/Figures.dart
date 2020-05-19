class Figures {
  final int id;
  final String localite;
  final String commune;
  final double x;
  final double y;
  final String nbre_cas;


  Figures({
      this.id,
      this.localite,
      this.commune,
      this.x,
      this.y,
      this.nbre_cas,
      });

  factory Figures.fromJson(Map<String, dynamic> json) {
    return Figures(
      id: json['id'],
      localite: json['localite'],
      commune: json['commune'],
      x: json['x'],
      y: json['y'],
      nbre_cas: json['nbre_cas'],
    );
  }
}