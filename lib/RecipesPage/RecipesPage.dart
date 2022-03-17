import 'package:cloud_firestore/cloud_firestore.dart';
import 'Sort/Sortdropbar.dart';
import 'Filtern/FilterButton.dart';
import 'RecipeGUI/smallrecipeInfo.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/Recipe.dart';

class RecipesPage extends StatefulWidget {
  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  Future<List<Recipe>> getRecipesfromFirebase() async {
    if (getRecipeList!.isEmpty) {
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection('Recipes');

      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs
          .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>));
      getRecipeList!.clear();
      for (var item in allData) {
        getRecipeList!.add(item);
        firebaseList!.add(item);
      }
      return getRecipeList!;
    } else {
      return getRecipeList!;
    }
  }

  @override
  initState() {
    super.initState();
  }

  List<Recipe>? firebaseList = [];
  List<Recipe>? getRecipeList = [];
  bool isSearching = false;

  void checksifinputexist(String inp) {
    if (inp == "") {
      getRecipeList!.clear();
      getRecipesfromFirebase();
    } else {
      getfilterItems(inp);
    }
  }

  void getfilterItems(String inp) {
    List<Recipe> toRemove = [];
    getRecipeList!.forEach((element) {
      if (!element.name!.toLowerCase().contains(inp.toLowerCase())) {
        toRemove.add(element);
      }
    });
    getRecipeList!.removeWhere((e) => toRemove.contains(e));
  }

  callback(varTopic) {
    setState(() {
      getRecipeList = varTopic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: !isSearching
            ? Center(child: Text('Rezepte'))
            : TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (String input) {
                  setState(() {
                    checksifinputexist(input);
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
                      this.isSearching = !this.isSearching;
                      getRecipeList!.clear();
                      getRecipesfromFirebase();
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
      body: FutureBuilder(
        future: getRecipesfromFirebase(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Could not load the data!'));
              } else {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FilterButton(
                              callbackFunction: callback,
                              list: getRecipeList,
                              firebaselist: firebaseList,
                            ),
                          ),
                          Expanded(
                            child: SortDropBar(
                              list: getRecipeList,
                              callbackFunction: callback,
                              firebaseList: firebaseList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: getRecipeList!.length,
                        itemBuilder: (cxt, index) {
                          final recipe = getRecipeList![index];
                          return RecipeInfoSmall(recipe);
                        },
                      ),
                    )
                  ],
                );
              }
          }
        },
      ),
    );
  }
}
