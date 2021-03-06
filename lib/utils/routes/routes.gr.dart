// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/material.dart' as _i28;

import '../../AfterLogin/AfterLoginPage.dart' as _i2;
import '../../ChallengePage/PointHistory.dart' as _i3;
import '../../ChallengePage/RewardPage.dart' as _i4;
import '../../FavoritePage/Filtern/caloriesfilter/CaloriesFilterPage.dart'
    as _i7;
import '../../FavoritePage/Filtern/Listviewoptions.dart' as _i6;
import '../../FavoritePage/Filtern/RecipeTypeFiltern/RecipeTypFilterPage.dart'
    as _i8;
import '../../FavoritePage/Filtern/TimeFilter/TimeFilterPage.dart' as _i9;
import '../../FavoritePage/RecipeGUI/FavRecipeDetails/FavRecipeDetailsPage.dart'
    as _i5;
import '../../FirstLogin/FirstLoginScreen/FirstLoginScreen.dart' as _i12;
import '../../FirstLogin/weeklygoalSetScreen/WeeklyGoalSetPage.dart' as _i10;
import '../../LoginPages/loginPage.dart' as _i1;
import '../../LoginPages/registrationPage.dart' as _i11;
import '../../models/Recipe.dart' as _i29;
import '../../ProfilePage/OptionPage/AccountDetails/AccountDetailsPage.dart'
    as _i16;
import '../../ProfilePage/OptionPage/AccountDetails/EditAccountPage.dart'
    as _i26;
import '../../ProfilePage/OptionPage/NotificationPage.dart' as _i17;
import '../../ProfilePage/OptionPage/OptionsconfigPage.dart' as _i13;
import '../../ProfilePage/OptionPage/SecurityPage.dart' as _i18;
import '../../ProfilePage/OptionPage/TermsofUsagePage.dart' as _i19;
import '../../ProfilePage/RankingPage.dart' as _i15;
import '../../ProfilePage/triumph.dart' as _i14;
import '../../RecipesPage/Filtern/caloriesfilter/CaloriesFilterPage.dart'
    as _i21;
import '../../RecipesPage/Filtern/Listviewoptions.dart' as _i20;
import '../../RecipesPage/Filtern/RecipeTypeFiltern/RecipeTypFilterPage.dart'
    as _i22;
import '../../RecipesPage/Filtern/TimeFilter/TimeFilterPage.dart' as _i23;
import '../../RecipesPage/RecipeGUI/LockedRecipeDetails/RecipeDetailslockedPage.dart'
    as _i24;
import '../../RecipesPage/RecipeGUI/UnlookedRecipeDetails/RecipeDetailsunlooked.dart'
    as _i25;

class Routes extends _i27.RootStackRouter {
  Routes([_i28.GlobalKey<_i28.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage());
    },
    AfterLoginRoute.name: (routeData) {
      final args = routeData.argsAs<AfterLoginRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.AfterLoginPage(args.selectedItem));
    },
    PointHistoryRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PointHistoryPage());
    },
    RewardRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RewardPage());
    },
    FavRecipeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FavRecipeDetailsRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.FavRecipeDetailsPage(args.recipe, args.callBack));
    },
    FavFilternRoute.name: (routeData) {
      final args = routeData.argsAs<FavFilternRouteArgs>(
          orElse: () => const FavFilternRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.FavFilternPage(callbackFunction: args.callbackFunction));
    },
    CaloriesFilterRoute.name: (routeData) {
      final args = routeData.argsAs<CaloriesFilterRouteArgs>(
          orElse: () => const CaloriesFilterRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i7.CaloriesFilterPage(callbackFunction: args.callbackFunction));
    },
    FavRecipeTypFilterRoute.name: (routeData) {
      final args = routeData.argsAs<FavRecipeTypFilterRouteArgs>(
          orElse: () => const FavRecipeTypFilterRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.FavRecipeTypFilterPage(
              callbackFunction: args.callbackFunction));
    },
    TimeFilterRoute.name: (routeData) {
      final args = routeData.argsAs<TimeFilterRouteArgs>(
          orElse: () => const TimeFilterRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.TimeFilterPage(callbackFunction: args.callbackFunction));
    },
    WeeklyGoalSetRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.WeeklyGoalSetPage());
    },
    RegistrationRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.RegistrationPage());
    },
    FirstLoginRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.FirstLoginPage());
    },
    OptionconfigRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.OptionconfigPage());
    },
    TriumphRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i14.TriumphPage());
    },
    RankingRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i15.RankingPage());
    },
    AccountDetailsRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.AccountDetailsPage());
    },
    NotificationRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.NotificationPage());
    },
    SecurityRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.SecurityPage());
    },
    TermsofUsageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.TermsofUsagePage());
    },
    RecipeFilternRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeFilternRouteArgs>(
          orElse: () => const RecipeFilternRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.RecipeFilternPage(
              callbackFunction: args.callbackFunction, list: args.list));
    },
    RecipeCaloriesFilterRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeCaloriesFilterRouteArgs>(
          orElse: () => const RecipeCaloriesFilterRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i21.RecipeCaloriesFilterPage(
              callbackFunction: args.callbackFunction, list: args.list));
    },
    RecipeTypFilterRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeTypFilterRouteArgs>(
          orElse: () => const RecipeTypFilterRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.RecipeTypFilterPage(
              callbackFunction: args.callbackFunction, list: args.list));
    },
    RecipeTimeFilterRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeTimeFilterRouteArgs>(
          orElse: () => const RecipeTimeFilterRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.RecipeTimeFilterPage(
              callbackFunction: args.callbackFunction, list: args.list));
    },
    RecipeDetailslookedRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailslookedRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i24.RecipeDetailslookedPage(args.recipe));
    },
    RecipeDetailsunlookedRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailsunlookedRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i25.RecipeDetailsunlookedPage(args.recipe));
    },
    EditAccountRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i26.EditAccountPage());
    }
  };

  @override
  List<_i27.RouteConfig> get routes => [
        _i27.RouteConfig(LoginRoute.name, path: '/'),
        _i27.RouteConfig(AfterLoginRoute.name, path: '/after-login-page'),
        _i27.RouteConfig(PointHistoryRoute.name, path: '/point-history-page'),
        _i27.RouteConfig(RewardRoute.name, path: '/reward-page'),
        _i27.RouteConfig(FavRecipeDetailsRoute.name,
            path: '/fav-recipe-details-page'),
        _i27.RouteConfig(FavFilternRoute.name, path: '/fav-filtern-page'),
        _i27.RouteConfig(CaloriesFilterRoute.name,
            path: '/calories-filter-page'),
        _i27.RouteConfig(FavRecipeTypFilterRoute.name,
            path: '/fav-recipe-typ-filter-page'),
        _i27.RouteConfig(TimeFilterRoute.name, path: '/time-filter-page'),
        _i27.RouteConfig(WeeklyGoalSetRoute.name,
            path: '/weekly-goal-set-page'),
        _i27.RouteConfig(RegistrationRoute.name, path: '/registration-page'),
        _i27.RouteConfig(FirstLoginRoute.name, path: '/first-login-page'),
        _i27.RouteConfig(OptionconfigRoute.name, path: '/optionconfig-page'),
        _i27.RouteConfig(TriumphRoute.name, path: '/triumph-page'),
        _i27.RouteConfig(RankingRoute.name, path: '/ranking-page'),
        _i27.RouteConfig(AccountDetailsRoute.name,
            path: '/account-details-page'),
        _i27.RouteConfig(NotificationRoute.name, path: '/notification-page'),
        _i27.RouteConfig(SecurityRoute.name, path: '/security-page'),
        _i27.RouteConfig(TermsofUsageRoute.name, path: '/termsof-usage-page'),
        _i27.RouteConfig(RecipeFilternRoute.name, path: '/recipe-filtern-page'),
        _i27.RouteConfig(RecipeCaloriesFilterRoute.name,
            path: '/recipe-calories-filter-page'),
        _i27.RouteConfig(RecipeTypFilterRoute.name,
            path: '/recipe-typ-filter-page'),
        _i27.RouteConfig(RecipeTimeFilterRoute.name,
            path: '/recipe-time-filter-page'),
        _i27.RouteConfig(RecipeDetailslookedRoute.name,
            path: '/recipe-detailslooked-page'),
        _i27.RouteConfig(RecipeDetailsunlookedRoute.name,
            path: '/recipe-detailsunlooked-page'),
        _i27.RouteConfig(EditAccountRoute.name, path: '/edit-account-page')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i27.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.AfterLoginPage]
class AfterLoginRoute extends _i27.PageRouteInfo<AfterLoginRouteArgs> {
  AfterLoginRoute({required int selectedItem})
      : super(AfterLoginRoute.name,
            path: '/after-login-page',
            args: AfterLoginRouteArgs(selectedItem: selectedItem));

  static const String name = 'AfterLoginRoute';
}

class AfterLoginRouteArgs {
  const AfterLoginRouteArgs({required this.selectedItem});

  final int selectedItem;

  @override
  String toString() {
    return 'AfterLoginRouteArgs{selectedItem: $selectedItem}';
  }
}

/// generated route for
/// [_i3.PointHistoryPage]
class PointHistoryRoute extends _i27.PageRouteInfo<void> {
  const PointHistoryRoute()
      : super(PointHistoryRoute.name, path: '/point-history-page');

  static const String name = 'PointHistoryRoute';
}

/// generated route for
/// [_i4.RewardPage]
class RewardRoute extends _i27.PageRouteInfo<void> {
  const RewardRoute() : super(RewardRoute.name, path: '/reward-page');

  static const String name = 'RewardRoute';
}

/// generated route for
/// [_i5.FavRecipeDetailsPage]
class FavRecipeDetailsRoute
    extends _i27.PageRouteInfo<FavRecipeDetailsRouteArgs> {
  FavRecipeDetailsRoute(
      {required _i29.Recipe recipe, required Function callBack})
      : super(FavRecipeDetailsRoute.name,
            path: '/fav-recipe-details-page',
            args:
                FavRecipeDetailsRouteArgs(recipe: recipe, callBack: callBack));

  static const String name = 'FavRecipeDetailsRoute';
}

class FavRecipeDetailsRouteArgs {
  const FavRecipeDetailsRouteArgs(
      {required this.recipe, required this.callBack});

  final _i29.Recipe recipe;

  final Function callBack;

  @override
  String toString() {
    return 'FavRecipeDetailsRouteArgs{recipe: $recipe, callBack: $callBack}';
  }
}

/// generated route for
/// [_i6.FavFilternPage]
class FavFilternRoute extends _i27.PageRouteInfo<FavFilternRouteArgs> {
  FavFilternRoute({Function? callbackFunction})
      : super(FavFilternRoute.name,
            path: '/fav-filtern-page',
            args: FavFilternRouteArgs(callbackFunction: callbackFunction));

  static const String name = 'FavFilternRoute';
}

class FavFilternRouteArgs {
  const FavFilternRouteArgs({this.callbackFunction});

  final Function? callbackFunction;

  @override
  String toString() {
    return 'FavFilternRouteArgs{callbackFunction: $callbackFunction}';
  }
}

/// generated route for
/// [_i7.CaloriesFilterPage]
class CaloriesFilterRoute extends _i27.PageRouteInfo<CaloriesFilterRouteArgs> {
  CaloriesFilterRoute({Function? callbackFunction})
      : super(CaloriesFilterRoute.name,
            path: '/calories-filter-page',
            args: CaloriesFilterRouteArgs(callbackFunction: callbackFunction));

  static const String name = 'CaloriesFilterRoute';
}

class CaloriesFilterRouteArgs {
  const CaloriesFilterRouteArgs({this.callbackFunction});

  final Function? callbackFunction;

  @override
  String toString() {
    return 'CaloriesFilterRouteArgs{callbackFunction: $callbackFunction}';
  }
}

/// generated route for
/// [_i8.FavRecipeTypFilterPage]
class FavRecipeTypFilterRoute
    extends _i27.PageRouteInfo<FavRecipeTypFilterRouteArgs> {
  FavRecipeTypFilterRoute({Function? callbackFunction})
      : super(FavRecipeTypFilterRoute.name,
            path: '/fav-recipe-typ-filter-page',
            args: FavRecipeTypFilterRouteArgs(
                callbackFunction: callbackFunction));

  static const String name = 'FavRecipeTypFilterRoute';
}

class FavRecipeTypFilterRouteArgs {
  const FavRecipeTypFilterRouteArgs({this.callbackFunction});

  final Function? callbackFunction;

  @override
  String toString() {
    return 'FavRecipeTypFilterRouteArgs{callbackFunction: $callbackFunction}';
  }
}

/// generated route for
/// [_i9.TimeFilterPage]
class TimeFilterRoute extends _i27.PageRouteInfo<TimeFilterRouteArgs> {
  TimeFilterRoute({Function? callbackFunction})
      : super(TimeFilterRoute.name,
            path: '/time-filter-page',
            args: TimeFilterRouteArgs(callbackFunction: callbackFunction));

  static const String name = 'TimeFilterRoute';
}

class TimeFilterRouteArgs {
  const TimeFilterRouteArgs({this.callbackFunction});

  final Function? callbackFunction;

  @override
  String toString() {
    return 'TimeFilterRouteArgs{callbackFunction: $callbackFunction}';
  }
}

/// generated route for
/// [_i10.WeeklyGoalSetPage]
class WeeklyGoalSetRoute extends _i27.PageRouteInfo<void> {
  const WeeklyGoalSetRoute()
      : super(WeeklyGoalSetRoute.name, path: '/weekly-goal-set-page');

  static const String name = 'WeeklyGoalSetRoute';
}

/// generated route for
/// [_i11.RegistrationPage]
class RegistrationRoute extends _i27.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(RegistrationRoute.name, path: '/registration-page');

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i12.FirstLoginPage]
class FirstLoginRoute extends _i27.PageRouteInfo<void> {
  const FirstLoginRoute()
      : super(FirstLoginRoute.name, path: '/first-login-page');

  static const String name = 'FirstLoginRoute';
}

/// generated route for
/// [_i13.OptionconfigPage]
class OptionconfigRoute extends _i27.PageRouteInfo<void> {
  const OptionconfigRoute()
      : super(OptionconfigRoute.name, path: '/optionconfig-page');

  static const String name = 'OptionconfigRoute';
}

/// generated route for
/// [_i14.TriumphPage]
class TriumphRoute extends _i27.PageRouteInfo<void> {
  const TriumphRoute() : super(TriumphRoute.name, path: '/triumph-page');

  static const String name = 'TriumphRoute';
}

/// generated route for
/// [_i15.RankingPage]
class RankingRoute extends _i27.PageRouteInfo<void> {
  const RankingRoute() : super(RankingRoute.name, path: '/ranking-page');

  static const String name = 'RankingRoute';
}

/// generated route for
/// [_i16.AccountDetailsPage]
class AccountDetailsRoute extends _i27.PageRouteInfo<void> {
  const AccountDetailsRoute()
      : super(AccountDetailsRoute.name, path: '/account-details-page');

  static const String name = 'AccountDetailsRoute';
}

/// generated route for
/// [_i17.NotificationPage]
class NotificationRoute extends _i27.PageRouteInfo<void> {
  const NotificationRoute()
      : super(NotificationRoute.name, path: '/notification-page');

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i18.SecurityPage]
class SecurityRoute extends _i27.PageRouteInfo<void> {
  const SecurityRoute() : super(SecurityRoute.name, path: '/security-page');

  static const String name = 'SecurityRoute';
}

/// generated route for
/// [_i19.TermsofUsagePage]
class TermsofUsageRoute extends _i27.PageRouteInfo<void> {
  const TermsofUsageRoute()
      : super(TermsofUsageRoute.name, path: '/termsof-usage-page');

  static const String name = 'TermsofUsageRoute';
}

/// generated route for
/// [_i20.RecipeFilternPage]
class RecipeFilternRoute extends _i27.PageRouteInfo<RecipeFilternRouteArgs> {
  RecipeFilternRoute({Function? callbackFunction, List<_i29.Recipe>? list})
      : super(RecipeFilternRoute.name,
            path: '/recipe-filtern-page',
            args: RecipeFilternRouteArgs(
                callbackFunction: callbackFunction, list: list));

  static const String name = 'RecipeFilternRoute';
}

class RecipeFilternRouteArgs {
  const RecipeFilternRouteArgs({this.callbackFunction, this.list});

  final Function? callbackFunction;

  final List<_i29.Recipe>? list;

  @override
  String toString() {
    return 'RecipeFilternRouteArgs{callbackFunction: $callbackFunction, list: $list}';
  }
}

/// generated route for
/// [_i21.RecipeCaloriesFilterPage]
class RecipeCaloriesFilterRoute
    extends _i27.PageRouteInfo<RecipeCaloriesFilterRouteArgs> {
  RecipeCaloriesFilterRoute(
      {Function? callbackFunction, List<_i29.Recipe>? list})
      : super(RecipeCaloriesFilterRoute.name,
            path: '/recipe-calories-filter-page',
            args: RecipeCaloriesFilterRouteArgs(
                callbackFunction: callbackFunction, list: list));

  static const String name = 'RecipeCaloriesFilterRoute';
}

class RecipeCaloriesFilterRouteArgs {
  const RecipeCaloriesFilterRouteArgs({this.callbackFunction, this.list});

  final Function? callbackFunction;

  final List<_i29.Recipe>? list;

  @override
  String toString() {
    return 'RecipeCaloriesFilterRouteArgs{callbackFunction: $callbackFunction, list: $list}';
  }
}

/// generated route for
/// [_i22.RecipeTypFilterPage]
class RecipeTypFilterRoute
    extends _i27.PageRouteInfo<RecipeTypFilterRouteArgs> {
  RecipeTypFilterRoute({Function? callbackFunction, List<_i29.Recipe>? list})
      : super(RecipeTypFilterRoute.name,
            path: '/recipe-typ-filter-page',
            args: RecipeTypFilterRouteArgs(
                callbackFunction: callbackFunction, list: list));

  static const String name = 'RecipeTypFilterRoute';
}

class RecipeTypFilterRouteArgs {
  const RecipeTypFilterRouteArgs({this.callbackFunction, this.list});

  final Function? callbackFunction;

  final List<_i29.Recipe>? list;

  @override
  String toString() {
    return 'RecipeTypFilterRouteArgs{callbackFunction: $callbackFunction, list: $list}';
  }
}

/// generated route for
/// [_i23.RecipeTimeFilterPage]
class RecipeTimeFilterRoute
    extends _i27.PageRouteInfo<RecipeTimeFilterRouteArgs> {
  RecipeTimeFilterRoute({Function? callbackFunction, List<_i29.Recipe>? list})
      : super(RecipeTimeFilterRoute.name,
            path: '/recipe-time-filter-page',
            args: RecipeTimeFilterRouteArgs(
                callbackFunction: callbackFunction, list: list));

  static const String name = 'RecipeTimeFilterRoute';
}

class RecipeTimeFilterRouteArgs {
  const RecipeTimeFilterRouteArgs({this.callbackFunction, this.list});

  final Function? callbackFunction;

  final List<_i29.Recipe>? list;

  @override
  String toString() {
    return 'RecipeTimeFilterRouteArgs{callbackFunction: $callbackFunction, list: $list}';
  }
}

/// generated route for
/// [_i24.RecipeDetailslookedPage]
class RecipeDetailslookedRoute
    extends _i27.PageRouteInfo<RecipeDetailslookedRouteArgs> {
  RecipeDetailslookedRoute({required _i29.Recipe recipe})
      : super(RecipeDetailslookedRoute.name,
            path: '/recipe-detailslooked-page',
            args: RecipeDetailslookedRouteArgs(recipe: recipe));

  static const String name = 'RecipeDetailslookedRoute';
}

class RecipeDetailslookedRouteArgs {
  const RecipeDetailslookedRouteArgs({required this.recipe});

  final _i29.Recipe recipe;

  @override
  String toString() {
    return 'RecipeDetailslookedRouteArgs{recipe: $recipe}';
  }
}

/// generated route for
/// [_i25.RecipeDetailsunlookedPage]
class RecipeDetailsunlookedRoute
    extends _i27.PageRouteInfo<RecipeDetailsunlookedRouteArgs> {
  RecipeDetailsunlookedRoute({required _i29.Recipe recipe})
      : super(RecipeDetailsunlookedRoute.name,
            path: '/recipe-detailsunlooked-page',
            args: RecipeDetailsunlookedRouteArgs(recipe: recipe));

  static const String name = 'RecipeDetailsunlookedRoute';
}

class RecipeDetailsunlookedRouteArgs {
  const RecipeDetailsunlookedRouteArgs({required this.recipe});

  final _i29.Recipe recipe;

  @override
  String toString() {
    return 'RecipeDetailsunlookedRouteArgs{recipe: $recipe}';
  }
}

/// generated route for
/// [_i26.EditAccountPage]
class EditAccountRoute extends _i27.PageRouteInfo<void> {
  const EditAccountRoute()
      : super(EditAccountRoute.name, path: '/edit-account-page');

  static const String name = 'EditAccountRoute';
}
