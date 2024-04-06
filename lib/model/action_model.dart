import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'action_model.g.dart';

@HiveType(typeId: 1)
class ActionModel {

@HiveField(0)
String action;

@HiveField(1)
bool finished;

@HiveField(2)
String? category;

  ActionModel({required this.action, this.finished = false, this.category});

}