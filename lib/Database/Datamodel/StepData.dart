import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

@Entity(tableName: 'steps_table')
class StepData {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "step_id")
  int id;

  @ColumnInfo(name: "count of steps")
  int steps;

  @ColumnInfo(name: "distance")
  double distance;

  @ColumnInfo(name: "Date_of_Walking")
  String stepDate;

  @ColumnInfo(name: "Walking_time")
  String time;

  StepData({
    this.id,
    this.steps,
    this.distance,
    this.stepDate,
    this.time,
  });
}
