import 'package:flutter/material.dart';


class TodoItem extends StatefulWidget {
  final bool isCompleted;
  final String title;
  final Function(bool?)? onTap;
  final Color textColor;
  const TodoItem({super.key, this.isCompleted = false, required this.title,
    this.textColor = Colors.black87,
    required this.onTap});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  late bool _isCompleted;
  _toggleStatus(){
    setState(() {
      _isCompleted = !_isCompleted;
    });

  }

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _isCompleted,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (val){
        _toggleStatus();
        // if(widget.onTap != null){
        // widget.onTap!(val ?? false)!;
        // }
      },
      title: Text(widget.title,
        style: TextStyle(color: widget.textColor, fontWeight: FontWeight.w500,
            decoration: _isCompleted ? TextDecoration.lineThrough : null
        ),),);
  }
}


