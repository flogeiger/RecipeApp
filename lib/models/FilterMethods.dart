import 'package:sample/models/Recipe.dart';

class FilterMethods {
  static void swap(List<Recipe> list, int i, int j) {
    var temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }

  static int pivot(List<Recipe> list, int start, int end) {
    var pivot = list[start].duration;
    int swapIdx = start;
    for (int i = start + 1; i < list.length; i++) {
      if (pivot! > list[i].duration!) {
        swapIdx++;
        swap(list, swapIdx, i);
      }
    }
    swap(list, start, swapIdx);
    return swapIdx;
  }

  static List<Recipe> quickSort(List<Recipe> listrecip, int left, int right) {
    if (left < right) {
      int pivotIndex = pivot(listrecip, left, right);
      //left
      quickSort(listrecip, left, pivotIndex - 1);
      //right
      quickSort(listrecip, pivotIndex + 1, right);
    }
    return listrecip;
  }

  static List<Recipe> getnewestRecipes(List<Recipe> list) {
    return list.reversed.toList();
  }

  static List<Recipe> getnormalRecipelist(List<Recipe> list) {
    return list;
  }

  static List<Recipe> insertionSortforEasiest(List<Recipe> listrecip) {
    for (var i = 0; i < listrecip.length; i++) {
      var currentVal = listrecip[i];
      var j = i - 1;
      for (j;
          j >= 0 &&
              listrecip[j].preparationsteps!.length >
                  currentVal.preparationsteps!.length;
          j--) {
        listrecip[j + 1] = listrecip[j];
      }
      listrecip[j + 1] = currentVal;
    }
    return listrecip;
  }
}
