// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DatabaseRecipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseRecipeAdapter extends TypeAdapter<DatabaseRecipe> {
  @override
  final int typeId = 0;

  @override
  DatabaseRecipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseRecipe()
      ..recipeName = fields[0] as String
      ..description = fields[1] as String
      ..recipeTyp = fields[2] as String
      ..picUrl = fields[3] as String
      ..duration = fields[4] as int
      ..kilocal = fields[5] as int
      ..recipestep1 = fields[6] as String
      ..recipestep2 = fields[7] as String
      ..recipestep3 = fields[8] as String
      ..recipestep4 = fields[9] as String
      ..recipestep5 = fields[10] as String
      ..recipestep6 = fields[11] as String
      ..giftedrecipe = fields[12] as bool;
  }

  @override
  void write(BinaryWriter writer, DatabaseRecipe obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.recipestep1)
      ..writeByte(7)
      ..write(obj.recipestep2)
      ..writeByte(8)
      ..write(obj.recipestep3)
      ..writeByte(9)
      ..write(obj.recipestep4)
      ..writeByte(10)
      ..write(obj.recipestep5)
      ..writeByte(11)
      ..write(obj.recipestep6)
      ..writeByte(12)
      ..write(obj.giftedrecipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseRecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
