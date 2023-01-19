import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample/model/todo.dart';
import 'package:todo_sample/provider/todo_provider.dart';
import 'package:todo_sample/widgets/todo_form_widget.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({Key? key}) : super(key: key);

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
 final _formKey = GlobalKey<FormState>();
 String title = '';
 String description = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              'Add Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
             SizedBox(height: 8,),
      
             TodoFormWidget(
              onChangedTitle : (title) {
                setState(() {
                  this.title = title;
                });
              },
              onChangedDescription : (description) {
                setState(() {
                  this.description = description;
                });
              },
              onSavedTodo:addTodo
      
             )
          ],
        ),
      ),
    );
  }

  void addTodo () {
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    } else {
      final newTodo =  Todo(
        title: title,
        description: description,
        id: DateTime.now().toString()
        )
        ;
    final provider = Provider.of<TodosProvider>(context, listen: false).addTodo(newTodo);
    }
    Navigator.of(context).pop(); 

  }
}