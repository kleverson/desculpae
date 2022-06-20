import 'package:desculpae/persistence/entities/pretext_entity.dart';
import 'package:floor/floor.dart';

import 'interfaces/repository_dao_interface.dart';

@dao
abstract class PretextRepositoryDao
    extends IRepositoryDaoInterface<PretextEntity> {
  @Query('SELECT * FROM Pretext WHERE categoryId= :category')
  Future<List<PretextEntity>> getAllById(int category);

  @Query('SELECT * FROM Pretext WHERE favorite=true')
  Future<List<PretextEntity>> getAllFavorite();

  @Query('SELECT * FROM Pretext')
  Future<List<PretextEntity>> getAll();

  @Query('UPDATE Pretext SET favorite=true WHERE id= :id')
  Future<int> setFavorite(int id);
}
