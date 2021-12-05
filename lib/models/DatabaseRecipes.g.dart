// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DatabaseRecipes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseRecipesAdapter extends TypeAdapter<DatabaseRecipes> {
  @override
  final int typeId = 0;

  @override
  DatabaseRecipes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseRecipes()
      ..recipeName = fields[0] as String
      ..description = fields[1] as String
      ..recipeTyp = fields[2] as String
      ..picUrl = fields[3] as String
      ..duration = fields[4] as int
      ..kilocal = fields[5] as int
      ..giftedrecipe = fields[6] as bool
      ..kfav = fields[7] as bool
      ..preparationList = (fields[8] as List)?.cast<dynamic>()
      ..ingredientslist = (fields[9] as List)?.cast<dynamic>()
      ..savingTimerecipe = fields[10] as String;
  }

  @override
  void write(BinaryWriter writer, DatabaseRecipes obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.recipeName)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.recipeTyp)
      ..writeByte(3)
      ..write(obj.picUrl)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.kilocal)
      ..writeByte(6)
      ..write(obj.giftedrecipe)
      ..writeByte(7)
      ..write(obj.kfav)
      ..writeByte(8)
      ..write(obj.preparationList)
      ..writeByte(9)
      ..write(obj.ingredientslist)
      ..writeByte(10)
      ..write(obj.savingTimerecipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseRecipesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
