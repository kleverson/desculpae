import 'package:desculpae/pages/menu_page.dart';
import 'package:desculpae/pages/splash_page.dart';
import 'package:desculpae/persistence/db/database.dart';
import 'package:desculpae/routes.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DesculpAEApp(
    db: await $FloorAppDatabase.databaseBuilder('app_desculpae.db').build(),
  ));
}

class DesculpAEApp extends StatelessWidget {

  const DesculpAEApp({Key? key, required this.db}) : super(key: key);
  final AppDatabase db;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DesculpAÊ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'fishfingers'
      ),
      home: SplashPage(db:db),
      routes: <String, WidgetBuilder>{
        Routes.menu:(context) => MenuPage(db: db)
      },
    );
  }
}