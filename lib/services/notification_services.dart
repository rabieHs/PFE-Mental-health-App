import 'package:flutter/material.dart';

class NotificationServices {
  showSnackBar(String content, BuildContext context, Color _color) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: _color, content: Text(content)));
  }
}
