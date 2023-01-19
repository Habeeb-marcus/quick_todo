import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample/provider/todo_provider.dart';
import 'package:todo_sample/utils.dart';

import '../model/todo.dart';

class ItemList extends StatefulWidget {
  final String title;
  final String description;
  final Todo todo;
  const ItemList({Key? key, required this.title, required this.description, required this.todo}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
      final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todo;
    final lastTodo = todos.length - 1;

    return   Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric( vertical: 15),
          decoration: BoxDecoration(
            // shape: BoxShape.rectangle,
            color:Color.fromARGB(255, 234, 233, 228),
            borderRadius: BorderRadius.circular(
              10
            )
            ),

          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 10,),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [Text(widget.description,
                  style:  TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.w500,
                    decoration: selected ? TextDecoration.lineThrough : null
                    ),
                  ),
                  ]
                ),
              ],
            ),
            leading:   Checkbox(
                        value: selected,
                        // checkColor: Colors.yellow,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                        activeColor: Colors.yellow[600],
                        onChanged: (_) {
                          setState(() {
                            selected = !selected;
                          });
                        },
                      ),
            trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    
                      IconButton(
                        onPressed: () {
                          removeTodo(widget.title);
                        },
                        
                        icon: const Icon(Icons.delete),
                      ),
                    ])

          ),
        ),
       todos[lastTodo].title ==  widget.todo.title ?
       SizedBox(
        height: 30,
       ): Container()
      ],
    );
  }

  void removeTodo( String todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false).removeTodo(todo);
    Utils.showSnackBar(context, 'Task successfully deleted! 😇');
  }
}