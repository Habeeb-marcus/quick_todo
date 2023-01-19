import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoFormWidget extends StatelessWidget {
  final String ?title;
  final String ? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key? key, 
    this.title = '', 
    this.description = '', 
    required this.onChangedTitle, 
    required this.onChangedDescription, 
    required this.onSavedTodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize:  MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(height: 8,), 
          buildDescription(),
          SizedBox(height: 45,), 
          buildButton()

        ],
      ),
    );
  }

Widget buildTitle() => TextFormField(
  initialValue: title,
  onChanged:  onChangedTitle,
  validator: (title) {
    if(title!.isEmpty){
      return 'The title cannot be empty';
    }
    return null;
  },
decoration: InputDecoration(
  border: UnderlineInputBorder(),
  labelText: 'Title'
 )
);

Widget buildDescription()=> TextFormField(
  initialValue: description,
  maxLines: 3,
  onChanged: onChangedDescription,
  validator: (description) {
    if(description!.isEmpty){
      return 'The description cannot be empty';
    }
    return null;
  },
  decoration: InputDecoration(
    border: UnderlineInputBorder(),
    labelText: 'Description'),
);

Widget buildButton() => SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: onSavedTodo, 
    child: Text('Save'),
    style: ElevatedButton.styleFrom(
      primary: Colors.black
    ),
    ),
);


}
