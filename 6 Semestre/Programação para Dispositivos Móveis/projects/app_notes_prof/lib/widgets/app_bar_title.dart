import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key}); // key do extends
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('images/note-icon.png', height: 35),
        const SizedBox(width: 8),
        const Text('CCO Notes',
            style: TextStyle(color: Colors.orange, fontSize: 20)),
      ],
    );
  }
}
