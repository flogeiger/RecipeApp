import 'package:auto_route/annotations.dart';
import 'package:sample/AfterLogin/AfterLoginPage.dart';
import 'package:sample/ChallengePage/PointHistory.dart';
import 'package:sample/ChallengePage/RewardPage.dart';
import 'package:sample/FavoritePage/Filtern/Listviewoptions.dart';
import 'package:sample/FavoritePage/Filtern/RecipeTypeFiltern/RecipeTypFilterPage.dart';
import 'package:sample/FavoritePage/Filtern/TimeFilter/TimeFilterPage.dart';
import 'package:sample/FavoritePage/Filtern/caloriesfilter/CaloriesFilterPage.dart';
import 'package:sample/FavoritePage/RecipeGUI/FavRecipeDetails/FavRecipeDetailsPage.dart';
import 'package:sample/FirstLogin/FirstLoginScreen/FirstLoginScreen.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/WeeklyGoalSetPage.dart';
import 'package:sample/LoginPages/loginPage.dart';
import 'package:sample/LoginPages/registrationPage.dart';
import 'package:sample/ProfilePage/OptionPage/AccountDetailsPage.dart';
import 'package:sample/ProfilePage/OptionPage/NotificationPage.dart';
import 'package:sample/ProfilePage/OptionPage/OptionsconfigPage.dart';
import 'package:sample/ProfilePage/OptionPage/SecurityPage.dart';
import 'package:sample/ProfilePage/OptionPage/TermsofUsagePage.dart';
import 'package:sample/ProfilePage/RankingPage.dart';
import 'package:sample/ProfilePage/triumph.dart';
import 'package:sample/RecipesPage/Filtern/Listviewoptions.dart';
import 'package:sample/RecipesPage/Filtern/RecipeTypeFiltern/RecipeTypFilterPage.dart';
import 'package:sample/RecipesPage/Filtern/TimeFilter/TimeFilterPage.dart';
import 'package:sample/RecipesPage/Filtern/caloriesfilter/CaloriesFilterPage.dart';
import 'package:sample/RecipesPage/RecipeGUI/LockedRecipeDetails/RecipeDetailslockedPage.dart';
import 'package:sample/RecipesPage/RecipeGUI/UnlookedRecipeDetails/RecipeDetailsunlooked.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    MaterialRoute(page: LoginPage, initial: true),
    MaterialRoute(page: AfterLoginPage),
    MaterialRoute(page: PointHistoryPage),
    MaterialRoute(page: RewardPage),
    MaterialRoute(page: FavRecipeDetailsPage),
    MaterialRoute(page: FavFilternPage),
    MaterialRoute(page: CaloriesFilterPage),
    MaterialRoute(page: FavRecipeTypFilterPage),
    MaterialRoute(page: TimeFilterPage),
    MaterialRoute(page: WeeklyGoalSetPage),
    MaterialRoute(page: RegistrationPage),
    MaterialRoute(page: FirstLoginPage),
    MaterialRoute(page: OptionconfigPage),
    MaterialRoute(page: TriumphPage),
    MaterialRoute(page: RankingPage),
    MaterialRoute(page: AccountDetailsPage),
    MaterialRoute(page: NotificationPage),
    MaterialRoute(page: SecurityPage),
    MaterialRoute(page: TermsofUsagePage),
    MaterialRoute(page: RecipeFilternPage),
    MaterialRoute(page: RecipeCaloriesFilterPage),
    MaterialRoute(page: RecipeTypFilterPage),
    MaterialRoute(page: RecipeTimeFilterPage),
    MaterialRoute(page: RecipeDetailslookedPage),
    MaterialRoute(page: RecipeDetailsunlookedPage)
  ],
)
class $Routes {}
