import '../Database/Datamodel/PointsData.dart';
import '../Database/Helper.dart';

class SavePoints {
  static savingDateinFavRecip() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate;
  }

  static savePoints(int pointcount, String usetype) async {
    await Helper.insertPoints(
      PointsData(
        id: null,
        pointsAmount: pointcount,
        pointusetype: usetype,
        time: savingDateinFavRecip(),
      ),
    );
  }
}
