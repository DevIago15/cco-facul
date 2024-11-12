class Note {
  final String titulo;
  final String descricao;

  //Precisamos adicionar um atributo id, pois ele é o identificador
  //de um Note, vindo do firebase
  final String documentId;

  Note(
      {required this.titulo,
      required this.descricao,
      required this.documentId});

  //Precisamos adicionar um atributo id no metodo de mapeamento
  // pois ele é o identificador de um Note, vindo do firebase
  factory Note.fromJson(String documentId, Map<String, Object?> json) {
    return Note(
        documentId: documentId,
        titulo: json['titulo']! as String,
        descricao: json['descricao']! as String);
  }

  toJson() {
    return {'titulo': titulo, 'descricao': descricao};
  }
}
