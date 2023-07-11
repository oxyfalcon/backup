import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  String _title = "";
  String _description = "";
  String get title => _title;
  String get description => _description;

  set title(String t) {
    _title = title;
  }

  set description(String d) {
    _description = description;
  }
}
