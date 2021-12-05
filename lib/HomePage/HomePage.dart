import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/HomePage/Sort/Sortdropbar.dart';
import 'package:sample/HomePage/Filtern/FilterButton.dart';
import 'package:sample/HomePage/RecipeGUI/smallrecipeInfo.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/Recipe.dart';

class HomePage extends StatefulWidget {
  bool filtern;
  List<Recipe> recipeList;
  HomePage(this.filtern, this.recipeList);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> getRecipeList = [];

  Future<List<Recipe>> getDatafromFirebase() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Recipes');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<Recipe> listtRecipe = [];

    Recipe recipeclass;
    getRecipeList.clear();
    for (var item in allData) {
      Map<String, dynamic> tst = Map<String, dynamic>.from(item);
      recipeclass = Recipe.fromJson(tst);
      listtRecipe.add(recipeclass);
      getRecipeList.add(recipeclass);
    }
    return listtRecipe;
  }

  Widget buildRecipes(List<Recipe> recipes) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: recipes.length,
        itemBuilder: (cxt, index) {
          final recipe = recipes[index];
          return RecipeInfoSmall(recipe);
        },
      );

  @override
  initState() {
    super.initState();
    getDatafromFirebase();
  }

  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          this.isSearching = !this.isSearching;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: !isSearching
              ? Center(child: Text('Hompage'))
              : TextField(
                  style: TextStyle(color: Colors.white),
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
                        child: FilterButton(),
                      ),
                      Expanded(
                        child: SortDropBar(getRecipeList),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: widget.filtern == false
                      ? FutureBuilder(
                          future: getDatafromFirebase(),
                          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                            final recipe = snapshot.data;
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Center(
                                    child: CircularProgressIndicator());
                              default:
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Could not load the data!'));
                                } else {
                                  return buildRecipes(recipe);
                                }
                            }
                          },
                        )
                      : buildRecipes(widget.recipeList),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
