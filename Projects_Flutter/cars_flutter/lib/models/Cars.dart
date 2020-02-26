class Car {
  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;

  Car({
    this.id,
    this.nome,
    this.tipo,
    this.descricao,
    this.urlFoto,
    this.urlVideo,
    this.latitude,
    this.longitude,
  });

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    descricao = json['descricao'];
    urlFoto = json['urlFoto'];
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
