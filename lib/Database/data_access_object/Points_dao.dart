import 'package:floor/floor.dart';
import 'package:sample/Database/Datamodel/PointsData.dart';

@dao
abstract class Points_dao {
  @Query('SELECT * FROM points_table')
  Future<List<PointsData>> getAllEntrysfromTable();
  @delete
  Future<void> deletePointData(PointsData pointsData);

  @insert
  Future<void> insertPointData(PointsData pointsData);
}
