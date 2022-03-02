import 'package:flutter/material.dart';
import 'package:pre_test_app/provider/list_post_provider.dart';
import 'package:pre_test_app/screens/list_post_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pre Test',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ),
        home: ChangeNotifierProvider(
            create: (_) => ListPostProvider(), child: const ListPostScreen()));
  }
}
