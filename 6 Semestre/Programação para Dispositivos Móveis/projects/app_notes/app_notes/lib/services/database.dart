// Para testes
import 'package:app_notes/models/notes.dart';

final List<Note> notas = [Note(titulo: "Aula 1", descricao: "Conteudo 1")];

class Database {
  static List<Note> readItems () {
    return notas;
  }
  
  static void addItem (Note nota) {
    notas.add(nota);
  }
}