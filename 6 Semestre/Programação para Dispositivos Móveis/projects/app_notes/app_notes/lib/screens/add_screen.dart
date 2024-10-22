import 'package:app_notes/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';
import '../widgets/add_item_form.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C384A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF2C384A),
          title: const AppBarTitle(),
        ),
        body: const SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: AddItemForm()),
        ),
      ),
    );
  }
}
