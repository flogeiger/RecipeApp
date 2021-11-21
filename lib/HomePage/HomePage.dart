import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/HomePage/Sort/Sortdropbar.dart';
import 'package:sample/HomePage/Filtern/FilterButton.dart';
import 'package:sample/HomePage/RecipeGUI/smallrecipeInfo.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/Recipe.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedSearchBar(),
      ),
    );
  }
}

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  Future<List<Recipe>> getData() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Recipes');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<Recipe> listtRecipe = [];
    for (var item in allData) {
      Map<String, dynamic> tst = Map<String, dynamic>.from(item);
      recipeclass = Recipe.fromJson(tst);
      listtRecipe.add(recipeclass);
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

  Recipe recipeclass;
  @override
  initState() {
    super.initState();
    getData();
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
                        child: SortDropBar(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: FutureBuilder(
                      future: getData(),
                      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                        final recipe = snapshot.data;
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                          default:
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Could not load the data!'));
                            } else {
                              return buildRecipes(recipe);
                            }
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
