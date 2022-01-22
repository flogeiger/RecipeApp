// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorCostumeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CostumeDatabaseBuilder databaseBuilder(String name) =>
      _$CostumeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CostumeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$CostumeDatabaseBuilder(null);
}

class _$CostumeDatabaseBuilder {
  _$CostumeDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$CostumeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$CostumeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<CostumeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$CostumeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$CostumeDatabase extends CostumeDatabase {
  _$CostumeDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  Step_dao? _stepsdaoInstance;

  Fav_dao? _favoriteRecipedaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `steps_table` (`step_id` INTEGER PRIMARY KEY AUTOINCREMENT, `count of steps` INTEGER, `distance` REAL, `Date_of_Walking` TEXT, `Walking_time` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `fav_table` (`recipe_id` INTEGER PRIMARY KEY AUTOINCREMENT, `recipe_Name` TEXT, `description` TEXT, `recipeTyp` TEXT, `picUrl` TEXT, `duration` INTEGER, `kilocal` INTEGER, `recipe_preparation` TEXT, `recipe_ingredients` TEXT, `Time_Recipe_save` TEXT, `Saving_Flag` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  Step_dao get stepsdao {
    return _stepsdaoInstance ??= _$Step_dao(database, changeListener);
  }

  @override
  Fav_dao get favoriteRecipedao {
    return _favoriteRecipedaoInstance ??= _$Fav_dao(database, changeListener);
  }
}

class _$Step_dao extends Step_dao {
  _$Step_dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<StepData>> getAllentrysfromtable() async {
    return _queryAdapter.queryList('SELECT * from steps_table',
        mapper: (Map<String, Object?> row) => StepData(
            id: row['step_id'] as int?,
            steps: row['count of steps'] as int?,
            distance: row['distance'] as double?,
            stepDate: row['Date_of_Walking'] as String?,
            time: row['Walking_time'] as String?));
  }
}

class _$Fav_dao extends Fav_dao {
  _$Fav_dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _favoriteRecipInsertionAdapter = InsertionAdapter(
            database,
            'fav_table',
            (FavoriteRecip item) => <String, Object?>{
                  'recipe_id': item.id,
                  'recipe_Name': item.recipeName,
                  'description': item.description,
                  'recipeTyp': item.recipeTyp,
                  'picUrl': item.picUrl,
                  'duration': item.duration,
                  'kilocal': item.kilocal,
                  'recipe_preparation': item.preparationList,
                  'recipe_ingredients': item.ingredientslist,
                  'Time_Recipe_save': item.savingTimerecipe,
                  'Saving_Flag': item.savingFlag == null
                      ? null
                      : (item.savingFlag! ? 1 : 0)
                }),
        _favoriteRecipDeletionAdapter = DeletionAdapter(
            database,
            'fav_table',
            ['recipe_id'],
            (FavoriteRecip item) => <String, Object?>{
                  'recipe_id': item.id,
                  'recipe_Name': item.recipeName,
                  'description': item.description,
                  'recipeTyp': item.recipeTyp,
                  'picUrl': item.picUrl,
                  'duration': item.duration,
                  'kilocal': item.kilocal,
                  'recipe_preparation': item.preparationList,
                  'recipe_ingredients': item.ingredientslist,
                  'Time_Recipe_save': item.savingTimerecipe,
                  'Saving_Flag': item.savingFlag == null
                      ? null
                      : (item.savingFlag! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteRecip> _favoriteRecipInsertionAdapter;

  final DeletionAdapter<FavoriteRecip> _favoriteRecipDeletionAdapter;

  @override
  Future<List<FavoriteRecip>> getAllEntrysfromTable() async {
    return _queryAdapter.queryList('SELECT * FROM fav_table',
        mapper: (Map<String, Object?> row) => FavoriteRecip(
            id: row['recipe_id'] as int?,
            recipeName: row['recipe_Name'] as String?,
            description: row['description'] as String?,
            picUrl: row['picUrl'] as String?,
            ingredientslist: row['recipe_ingredients'] as String?,
            preparationList: row['recipe_preparation'] as String?,
            kilocal: row['kilocal'] as int?,
            duration: row['duration'] as int?,
            recipeTyp: row['recipeTyp'] as String?,
            savingTimerecipe: row['Time_Recipe_save'] as String?,
            savingFlag: row['Saving_Flag'] == null
                ? null
                : (row['Saving_Flag'] as int) != 0));
  }

  @override
  Future<FavoriteRecip?> checkingifDatabaseContainRecipe(
      String recipName, String url) async {
    return _queryAdapter.query(
        'SELECT * FROM fav_table WHERE recipe_Name = ?1 AND picUrl = ?2',
        mapper: (Map<String, Object?> row) => FavoriteRecip(
            id: row['recipe_id'] as int?,
            recipeName: row['recipe_Name'] as String?,
            description: row['description'] as String?,
            picUrl: row['picUrl'] as String?,
            ingredientslist: row['recipe_ingredients'] as String?,
            preparationList: row['recipe_preparation'] as String?,
            kilocal: row['kilocal'] as int?,
            duration: row['duration'] as int?,
            recipeTyp: row['recipeTyp'] as String?,
            savingTimerecipe: row['Time_Recipe_save'] as String?,
            savingFlag: row['Saving_Flag'] == null
                ? null
                : (row['Saving_Flag'] as int) != 0),
        arguments: [recipName, url]);
  }

  @override
  Future<List<FavoriteRecip>> findPersonsWithNamesLike(String recipName) async {
    return _queryAdapter.queryList(
        'SELECT * FROM fav_table WHERE recipe_Name LIKE ?1',
        mapper: (Map<String, Object?> row) => FavoriteRecip(
            id: row['recipe_id'] as int?,
            recipeName: row['recipe_Name'] as String?,
            description: row['description'] as String?,
            picUrl: row['picUrl'] as String?,
            ingredientslist: row['recipe_ingredients'] as String?,
            preparationList: row['recipe_preparation'] as String?,
            kilocal: row['kilocal'] as int?,
            duration: row['duration'] as int?,
            recipeTyp: row['recipeTyp'] as String?,
            savingTimerecipe: row['Time_Recipe_save'] as String?,
            savingFlag: row['Saving_Flag'] == null
                ? null
                : (row['Saving_Flag'] as int) != 0),
        arguments: [recipName]);
  }

  @override
  Future<void> insertRecipe(FavoriteRecip recip) async {
    await _favoriteRecipInsertionAdapter.insert(
        recip, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteRecipe(FavoriteRecip recip) async {
    await _favoriteRecipDeletionAdapter.delete(recip);
  }
}
