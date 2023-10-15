import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveinflutter/Models/notes_model.dart';
import 'package:path_provider/path_provider.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>("Notes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive Flutter',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}
