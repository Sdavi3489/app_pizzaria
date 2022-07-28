class User {
  //int? id;
  String? nome;
  String? telefone;
  String? endereco;
  String? email;
  String? senha;

  User(
      { //this.id,
      this.nome,
      this.telefone,
      this.endereco,
      this.email,
      this.senha});

  User.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    nome = json['nome'];
    telefone = json['telefone'];
    endereco = json['endereco'];
    email = json['email'];
    senha = json['senha'];
  }
}
