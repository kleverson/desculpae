import 'package:desculpae/persistence/entities/entity_base.dart';
import 'package:floor/floor.dart';

abstract class IRepositoryDaoInterface<Table> {
  @insert
  Future<int> inserItem(Table item);

  @update
  Future<int> updateItem(Table item);

  @delete
  Future<int> deleteItem(Table item);

  
}
