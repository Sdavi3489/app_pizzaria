class Compra {
  String? id;
  String? nome;
  String? descricao;
  String? foto;
  int? valor;

  Compra({this.id, this.nome, this.descricao, this.foto, this.valor});

  Compra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    foto = json['foto'];
    valor = json['valor'];
  }
}
