import 'package:floor/floor.dart';
import 'package:sample/Database/Datamodel/PointsData.dart';

@dao
abstract class Points_dao {
  @Query('SELECT * FROM Points_table')
  Future<List<PointsData>> getAllEntrysfromTable();
}
