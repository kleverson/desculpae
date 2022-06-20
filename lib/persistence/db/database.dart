import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:desculpae/persistence/entities/category_entity.dart';
import 'package:desculpae/persistence/entities/pretext_entity.dart';
import 'package:desculpae/persistence/repositories/category_repository_dao.dart';
import 'package:desculpae/persistence/repositories/pretext_repository_dao.dart';
import 'package:floor/floor.dart';

part 'database.g.dart';

@Database(version: 1, entities: [CategoryEntity, PretextEntity])
abstract class AppDatabase extends FloorDatabase {
  CategoryRepositoryDao get categoryRepositoryDao;
  PretextRepositoryDao get pretextRepositoryDao;
}
