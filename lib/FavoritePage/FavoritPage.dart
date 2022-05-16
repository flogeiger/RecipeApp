import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:sample/Database/Datamodel/FavoriteData.dart';
import 'package:sample/Database/Helper.dart';
import 'package:sample/FavoritePage/FavoriteRecipeInfo.dart';
import 'package:sample/FavoritePage/Filtern/FilterButton.dart';
import 'package:sample/FavoritePage/Sort/Sortdropbar.dart';
import 'package:sample/models/Recipe.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Widget buildContent(List<Recipe> transactions) {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          'No expenses yet!',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = transactions[index];
                return buildRecipes(context, transaction, transactions, index);
              },
            ),
          ),
        ],
      );
    }
  }

  callback(varTopic) {
    setState(() {
      displayFavFuture = varTopic;
    });
  }

  setStatecallback() async {
    await getDatafromlokalDatabase(
        favRecipe(Helper.selectAllDataFromFavtable()));
    setState(() {});
  }

  Widget buildRecipes(
    BuildContext context,
    Recipe transaction,
    List<Recipe> transactions,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 5,
        bottom: 5,
        right: 20,
      ),
      child: Dismissible(
        child: FavoriteRecipeSmall(transaction, setStatecallback),
        direction: DismissDirection.endToStart,
        key: UniqueKey(),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            if (transactions.contains(transaction)) {
              setState(() {
                transactions.remove(transactions.removeAt(index));
                deleteTransaction(transaction);
              });
            }
          }
        },
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: Text('Löschen'),
        ),
      ),
    );
  }

  Future<List<Recipe>> favRecipe(Future<List<FavoriteRecip>> getlist) async {
    final list = await getlist;
    List<Recipe> recipeList = [];
    for (var item in list) {
      Recipe favitem = new Recipe(
          item.recipeName,
          item.description,
          item.recipeTyp,
          item.picUrl,
          item.savingTimerecipe,
          item.duration,
          item.savingFlag,
          convertStringtoList(item.preparationList!),
          item.kilocal,
          convertStringtoList(item.ingredientslist!),
          convertStringtoList(item.nutritionlist!),
          convertStringtoList(item.filterTyps!));
      recipeList.add(favitem);
    }
    return recipeList;
  }

  List<String> convertStringtoList(String input) {
    final list = input.split(',');
    return list;
  }

  deleteTransaction(Recipe transaction) async {}

  Future<void> getDatafromlokalDatabase(Future<List<Recipe>> data) async {
    displayFavFuture = data;
  }

  bool isSearching = false;
  Future<List<Recipe>>? displayFavFuture;
  @override
  initState() {
    super.initState();
    getDatafromlokalDatabase(favRecipe(Helper.selectAllDataFromFavtable()));
  }

  void checksifInputexist(String input) {
    String likeString = '%' + input + '%';
    if (input == "") {
      getDatafromlokalDatabase(favRecipe(Helper.selectAllDataFromFavtable()));
    } else {
      getDatafromlokalDatabase(
        favRecipe(
          Helper.selectAllDataLikeinput(likeString),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          automaticallyImplyLeading: false,
          title: !isSearching
              ? Center(
                  child: Text('Favoriten'),
                )
              : TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (input) {
                    setState(() {
                      checksifInputexist(input);
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search topic',
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white)),
                  autofocus: true,
                ),
          actions: [
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        getDatafromlokalDatabase(
                            favRecipe(Helper.selectAllDataFromFavtable()));
                        this.isSearching = !this.isSearching;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = !this.isSearching;
                      });
                    },
                  ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FilterButton(
                          callbackFunction: callback,
                        ),
                      ),
                      Expanded(
                        child: SortDropBar(
                          callbackFunction: callback,
                          list: displayFavFuture,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: FutureBuilder(
                    future: displayFavFuture,
                    builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError)
                          return Text(snapshot.error.toString());
                        else
                          return buildContent(snapshot.data);
                      } else
                        return Scaffold();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
