import 'package:app_notes/models/notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Para testes
//final List<Note> notas = [
//Note(titulo: "Aula 1", descricao: "Foi passado conteudo tal tal tal"),
//Note(titulo: "Aula 2", descricao: "Foi passado conteudo tal tal tal")
//];

final CollectionReference _mainCollection =
    FirebaseFirestore.instance.collection('notes');

class Database {
  //Usuario com acesso ao banco
  static String? userUid = "1";

  //Aqui teremos nossos metodos para buscar no banco de dados
  static Future<List<Note>> readItems() async {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    var items = await notesItemCollection.get();
    List<Note> notes = items.docs
      .where((noteDoc) => noteDoc.data() != null) // Filtra documentos não nulos
      .map((noteDoc) => Note.fromJson(noteDoc.data() as Map<String, dynamic>))
      .toList();
    return notes;
  }

  static Future<void> addItem(Note note) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = note.toJson();

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Item adicionado ao banco de dados"))
        .catchError((e) => print(e));
  }
}
