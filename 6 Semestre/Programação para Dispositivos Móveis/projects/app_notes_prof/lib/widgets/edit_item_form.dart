import 'package:flutter/material.dart';
import '../models/notes.dart';
import '../services/database.dart';
import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  const EditItemForm ({
    super.key,
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState ();
}

class _EditItemFormState extends State<EditItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState(){
    _titleController = TextEditingController(text: widget.currentTitle);
    _descriptionController = TextEditingController(text: widget.currentDescription);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                const Text(
                  'Título',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _titleController,
                  keyboardtype: TextInputType.text,
                  inputAction: TextInputAction.next,
                  label: 'Título',
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Descrição',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _descriptionController,
                  keyboardtype: TextInputType.text,
                  inputAction: TextInputAction.done,
                  label: 'Descrição',
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.orange,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () async {
                Note nota = Note(
                    documentId: widget.documentId,
                    titulo: _titleController.text,
                    descricao: _descriptionController.text);
                await Database.updateItem(nota);
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  'ALTERAR ITEM',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
