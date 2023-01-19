class TodoField {
   static const createdTime = 'createdTime';
}


class Todo {
  String title;
  String? id;
  String description;

Todo({
  required this.title,
   this.description = '',
   this.id,
});
}