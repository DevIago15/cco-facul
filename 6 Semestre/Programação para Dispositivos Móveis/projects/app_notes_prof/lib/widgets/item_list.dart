import 'package:app_notes/services/database.dart';
import 'package:flutter/material.dart';

import '../models/notes.dart';
import '../screens/edit_screen.dart';

//Item List agora devera ser stateful, pois precisamos atualizar
//quando terminar a atualizacao ou quando excluir um item
class ItemList extends StatefulWidget {
  ItemList({super.key});
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Note>>(
        future: Database.readItems(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> t) {
          return criaListView(t.data!);
        });
  }

  criaListView(List<Note> notas) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      itemCount: notas.length,
      itemBuilder: (context, index) {
        //Aqui carregamos os dados na listview
        var nota = notas[index];

        return Ink(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            //Aqui é responsavel para ir a area de edicao
            //Repare que passamos para o construtor de EditScreen
            //os atributos vindos do objeto nota, para quando o usuario
            //entrar na tela de edicao, os campos iniciarem preenchidos
            onTap: () => Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => EditScreen(
                        currentTitle: nota.titulo,
                        currentDescription: nota.descricao,
                        documentId: nota.documentId),
                  ),
                )
                .then((value) =>
                    setState(() {})), //aqui mandamos atualizar este widget
            //depois que é retornado da tela de edicao
            title: Text(
              nota.titulo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              nota.descricao,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
