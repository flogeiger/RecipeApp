import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:sample/models/Recipe.dart';

class FileManager {
  static FileManager _instance;
  FileManager._intervall() {
    _instance = this;
  }

  factory FileManager() => _instance ?? FileManager._intervall();

  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    // für Ios getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _jsonFile async {
    final path = await _localPath;
    return File('$path/favorits.json');
  }

  Future<List<Map<String, dynamic>>> readJsonFile() async {
    List<String> fileContent;
    List<Map<String, dynamic>> list;

    File file = await _jsonFile;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsLines();
        for (var item in fileContent) {
          var input = json.decode(item);
          list.add(input);
        }

        return list;
      } catch (e) {
        print(e);
      }
    }

    return null;
  }

  Future<Recipe> writeJsonFile(Recipe recp) async {
    File file = await _jsonFile;
    await file.writeAsString(json.encode(recp));
    return recp;
  }
}
