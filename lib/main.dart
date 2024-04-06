import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/action_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ActionModelAdapter());
  // ignore: unused_local_variable
  var box = await Hive.openBox<ActionModel>('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
