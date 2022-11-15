import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoRow extends StatelessWidget {
  final String nameTask;
  final bool completeTask;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoRow({
    super.key, 
    required this.nameTask,
    required this.completeTask,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0), 
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400),
            
          ],
        
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
        ),
          child: Row(
            children: [
      
              Checkbox(
                value: completeTask, 
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
      
       
              Text(
                nameTask,
                ),
            ],
          ),
        ),
      ),
    );
  }
}