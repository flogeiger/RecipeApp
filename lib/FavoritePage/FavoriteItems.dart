import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample/FavoritePage/FavoriteRecipeInfo.dart';
import 'package:sample/FavoritePage/testtestRecipe.dart';
import 'package:sample/models/DatabaseBox.dart';
import 'package:sample/models/DatabaseRecipes.dart';

class FavoriteItem extends StatefulWidget {
  @override
  _FavoriteItemState createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  Widget buildContent(List<DatabaseRecipes> transactions) {
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
          Padding(
            padding: EdgeInsets.only(left: 2, right: 2),
            child: Container(
              child: Text(
                'Favoriten',
                style: TextStyle(fontSize: 20),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
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

  Widget buildRecipes(
    BuildContext context,
    DatabaseRecipes transaction,
    List<DatabaseRecipes> transactions,
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
        child: FavoriteRecipeSmall(transaction),
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

  Widget buildButtons(BuildContext context, DatabaseRecipes recipe) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: Text('Edit'),
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionDialog(
                    recipe: recipe,
                    /*onClickedDone: (name, amount, isExpense) =>
                        editTransaction(transaction, name, amount, isExpense),*/
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: () => deleteTransaction(recipe),
            ),
          )
        ],
      );
  /*void editTransaction(
    DatabaseRecipe recipe,
    String name,
    double amount,
    bool isExpense,
  ) {
    recipe.RecipeName = name;
    transaction.amount = amount;
    transaction.isExpense = isExpense;

    // final box = Boxes.getTransactions();
    // box.put(transaction.key, transaction);

    transaction.save();
  }
*/
  void deleteTransaction(DatabaseRecipes transaction) {
    transaction.delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<Box<DatabaseRecipes>>(
          valueListenable: Boxes.getRecipe().listenable(),
          builder: (cxt, box, _) {
            final favRecipes = box.values.toList().cast<DatabaseRecipes>();
            return buildContent(favRecipes);
          },
        ),
      ),
    );
  }
}
