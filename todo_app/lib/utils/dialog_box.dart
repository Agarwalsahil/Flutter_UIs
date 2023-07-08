import 'package:flutter/material.dart';

import 'my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[200],
        // ignore: sized_box_for_whitespace
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2.0),
                  ),
                  hintText: 'Add a new task',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  const SizedBox(
                    width: 8,
                  ),
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              ),
            ],
          ),
        ));
  }
}
