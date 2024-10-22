import 'package:app_notes/services/database.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return criaListView();
  }

  criaListView() {
    var notas = Database.readItems();
    
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemCount: notas.length,
        itemBuilder: (context, index) {
          var nota = notas[index];
          return Ink(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onTap: () => {},
                title: Text(nota.titulo,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(nota.descricao,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
              ));
        });
  }
}