import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconText({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green,),
          Text(text, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 14),)
        ],
      ),
    );
  }
}