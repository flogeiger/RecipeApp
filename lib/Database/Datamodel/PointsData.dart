import 'package:floor/floor.dart';

@Entity(tableName: 'Points_table')
class PointsData {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "point_id")
  int? id;

  @ColumnInfo(name: "amount of points")
  int? pointsAmount;

  @ColumnInfo(name: "useType")
  double? pointusetype;

  @ColumnInfo(name: "points_time")
  String? time;

  PointsData({
    this.id,
    this.pointsAmount,
    this.pointusetype,
    this.time,
  });
}
