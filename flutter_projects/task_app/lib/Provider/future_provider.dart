import 'dart:convert';

import 'package:app/Provider/notify_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureTodoListProvider = FutureProvider<List<Todo>>((ref) async {
  final response = await ref.read(todoProvider.notifier).fetchTodo();
  List<Todo> list = [];
  String str = response.body;
  List<Map<String, dynamic>> mapResponse = jsonDecode(str);
  for (var itr in mapResponse) {
    list.add(Todo.fromJson(itr));
  }
  return list;
});
