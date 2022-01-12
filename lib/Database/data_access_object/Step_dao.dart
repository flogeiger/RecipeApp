import 'package:floor/floor.dart';
import 'package:sample/Database/Datamodel/StepData.dart';

@dao
abstract class Step_dao {
  @Query('SELECT * from steps_table')
  Future<List<StepData>> getAllentrysfromtable();
  //Date Formate ist in YYYY-MM-DD
//  @Query('SELECT * FROM steps_table WHERE DATE("now")= DATE(stepDate)')
  //Future<StepData> getCurrentDayStepData();

//  @Query('SELECT date("now","start of month","+1 month","-1 day")')
  //Future<Date> getLastDayOfMonth();
  ////überprüf nochmal Date als Datentyp hier

  //@Query('SELECT Sum(steps) FROM steps_table')
  //Future<int> getSumfromAllSteps();
}
