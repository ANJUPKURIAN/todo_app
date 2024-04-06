import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/model/action_model.dart';
//import 'package:flutter/material.dart';


class HomeScreenController {
  static List actionListKeys = [];

  static var todoBox = Hive.box<ActionModel>('todoBox');

  static getInitKeys() {
    actionListKeys = todoBox.keys.toList();
  }

  static void addAction(
      {
        required String action,
         bool finished= false,
          String? category})
           {
          todoBox .add(
          ActionModel(
            action: action, 
            finished: finished, 
            category: category));

    actionListKeys = todoBox.keys.toList();
  }

  static Future<void> deleteAction(var key) async {
    await todoBox.delete(key);
    actionListKeys = todoBox.keys.toList();
  }
}