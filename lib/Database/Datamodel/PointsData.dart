import 'package:floor/floor.dart';

@Entity(tableName: 'points_table')
class PointsData {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "point_id")
  int? id;

  @ColumnInfo(name: "amount_of_points")
  int? pointsAmount;

  @ColumnInfo(name: "useType")
  String? pointusetype;

  @ColumnInfo(name: "points_time")
  String? time;

  PointsData({
    this.id,
    this.pointsAmount,
    this.pointusetype,
    this.time,
  });
}
