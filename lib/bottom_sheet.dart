import 'package:flutter/material.dart';

class AddNewTransaction extends StatelessWidget {
  const AddNewTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Column(
      children: [
        const TextField(
          decoration: InputDecoration(hintText: 'Title'),
        ),
        const TextField(
          decoration: InputDecoration(hintText: 'price'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Choose Date'),
        ),
      ],
    ));
  }
}
