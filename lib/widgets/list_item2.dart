import 'package:flutter/material.dart';
import 'package:todo/widgets/todo_item.dart';

class ListItem2 extends StatelessWidget {
  final String text;
  const ListItem2({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white10,
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TodoItem(title: text, textColor: Colors.white, onTap: (val){},),
    );
  }
}
