import 'package:flutter/material.dart';
import 'package:todolist/buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback save;
  VoidCallback cancel;


  DialogBox({
    super.key, 
    required this.controller,
    required this.save,
    required this.cancel,
    });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override 
  Widget build (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 120,
        child: Column(children: [


          TextField(
            controller: widget.controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add Task",
              ),
          ),

          const SizedBox (height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                  //save
                   Button(text: "SAVE", onPressed: widget.save),
                  const SizedBox (width: 35),
                  //cancel
                  Button(text: "CANCEL", onPressed: widget.cancel),
    
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

