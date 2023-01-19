import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';
import '../widgets/add_todo_dialog.dart';
import '../widgets/item_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final provider = Provider.of<TodosProvider>(context);
      final todos = provider.todo;

    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            decoration:const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: const [
                Icon(
                  FontAwesomeIcons.stream
                ),
                SizedBox(
                  height: 10,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60, bottom: 30),
                  child: Text('Tasks',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),
      
          ),
           Expanded(
            child: todos.isEmpty?
           const Center(
              child: Text(
                'Click on the Plus icon below to add a task!  🎉',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ):
             ListView.separated(
              itemCount: todos.length,
              separatorBuilder: (BuildContext context, index) {
                return Container(
                    height: 8,
                  );

              },
              itemBuilder: (context, index) {
                final todo = todos[index];
                 index == todos.length - 1 ? 
                SizedBox(
                  height: 20,
                ) : Container();

                return ItemList(title: todo.title, description: todo.description, todo: todo,);
              } ))
        
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add item',
        backgroundColor: Colors.yellow,
        onPressed: () { 
          showDialog(
            context: context, 
            barrierDismissible: true,
            builder: (BuildContext context ) => AddTodoDialog(),
          );
         },
        child: const Icon(Icons.add,
        color: Colors.black ,
        ),
      ), //

    );
    
  }
}