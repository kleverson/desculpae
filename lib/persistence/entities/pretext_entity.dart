import 'package:desculpae/persistence/entities/entity_base.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Pretext')
class PretextEntity{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String text;
  final bool favorite;
  final int sentCount;
  final int categoryId;
  final String? createdAt;
  final String? updatedAt;

  PretextEntity({this.id, required this.text, required this.favorite, required this.sentCount, required this.categoryId, this.createdAt, this.updatedAt});

}
