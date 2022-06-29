class Comida {
  int? id;
  String? nome;
  String? descricao;
  String? foto;
  int? valor;

  Comida({this.id, this.nome, this.descricao, this.foto, this.valor});

  Comida.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    foto = json['foto'];
    valor = json['valor'];
  }
}

/*class Comida {
  final int _id;
  final String _nome;
  final String _descricao;
  final String _foto;
  final double _valor;

  int get id => _id;
  String get nome => _nome;
  String get descricao => _descricao;
  String get foto => _foto;
  double get valor => _valor;

  Comida(this._id, this._nome, this._descricao, this._foto, this._valor);
  
  Comida.fromJson(Map json) : _id=json['id'], _nome=json['nome'], _descricao=json['descricao'], _foto=json['foto'], _valor=json['valor'];
}*/