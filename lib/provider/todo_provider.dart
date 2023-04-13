import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:providerapi1/model/todo.dart';
import 'package:providerapi1/service/todo_service.dart';

class TodoProvider extends ChangeNotifier{
  final _service=TodoService();
  bool isLoading=false;
  List<Todo> _todos=[];
  List<Todo> get todos=>_todos;

  Future<void> getAllTodos() async{
    isLoading=true;
    notifyListeners();

    final response=await _service.getAll();
    _todos=response;
    isLoading=false;
    notifyListeners();
  }
}