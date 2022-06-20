import 'package:desculpae/persistence/entities/entity_base.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Category')
class CategoryEntity{
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;
  final String color;
  final String icon;
  final String? createdAt;
  final String? updatedAt;

  CategoryEntity({this.id, required this.title, required this.color, required this.icon, this.createdAt, this.updatedAt});

}
