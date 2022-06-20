
import 'package:desculpae/persistence/entities/category_entity.dart';
import 'package:desculpae/persistence/repositories/interfaces/repository_dao_interface.dart';
import 'package:floor/floor.dart';

@dao 
abstract class CategoryRepositoryDao extends IRepositoryDaoInterface<CategoryEntity>{

  @Query('SELECT * FROM Category')
  Future<List<CategoryEntity>> getAll();


  @Query('DELETE FROM Category')
  Future<void> removeAll();
}