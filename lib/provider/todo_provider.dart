


import 'package:flutter/material.dart';
import 'package:todo_sample/model/todo.dart';

class TodosProvider extends ChangeNotifier{
 
 final List<Todo> _todo = [
  // Todo(
  //     title: 'Walk a Cat',
  //     description: 
  //     '''
  //     Take cat to see a Vet.
  //     Take her for a treat.
  //       - Take her for a walk,
  //     '''
  //   ),
  // Todo(
  //     title: 'Walk a goat',
  //     description: 
  //     '''
  //       Take the goat to see a Vet.
  //       Take him for a treat.
  //       Take him for a walk,
  //     '''
  //   ),
  // Todo(
  //     title: 'Plan a family trip to Dubai',
  //     description: 
  //     '''
  //       Rent some hotels.
  //       Rent a car.
  //       Pack suitcase,
  //     '''
  //   ),
  // Todo(
  //     title: 'Walk a Cat',
  //     description: 
  //     '''
  //       Take cat to see a Vet.
  //       Take her for a treat.
  //       Take her for a walk,
  //     '''
  //   ),
  // Todo(title: 'Plan a family trip to Mecca', description: '''
  //       Rent some hotels.
  //       Rent a car.
  //       Pack suitcase,
  //     '''),
 
 
 ];


List<Todo> get todo => _todo;

void addTodo(Todo todo){
  _todo.add(todo);
  notifyListeners();
}

void removeTodo (String title){
  _todo.removeWhere((element) => element.title == title);
  notifyListeners();
}
}