import 'package:app_notes/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';
import '../services/database.dart';
import '../widgets/edit_item_form.dart';

class EditScreen extends StatelessWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  const EditScreen({
    super.key,
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C384A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF2C384A),
          title: const AppBarTitle(),
          actions: [
            //aqui vc pode adicionar widgets de acao na appbar
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
                size: 32,
              ),
              onPressed: () async {
                await Database.deleteItem(documentId);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              currentTitle: currentTitle,
              currentDescription: currentDescription,
              documentId: documentId,
            ),
          ),
        ),
      ),
    );
  }
}
