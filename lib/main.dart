import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/post_detail_screen.dart';
import './screens/community_post_screen.dart';
import './screens/filters_screen.dart';
import './screens/communities_screen.dart';
import './models/post.dart';
import'./widgets/loading_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import './screens/auth_screen.dart';
import './screens/inbox.dart';
import './screens/profile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                return TabsScreen(_favoriteMeals);
              }
              return AuthScreen();
            }),
      title: 'Perl Ngin',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/authentication',
      // // initialRoute: '/tabsScreen',// default is '/'
      routes: {
        '/tabsScreen': (ctx) => TabsScreen(_favoriteMeals),
        '/authentication': (ctx) => AuthScreen(),
        '/inbox':(ctx) => Inbox(),
        '/profile':(ctx) => Profile(),
      //   // AuthScreen.routeName: (ctx) => AuthScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      //
      },
      // onGenerateRoute: (settings) {

        // print(settings.arguments);
        // print(settings.arguments);
        // if()
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        // //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CommunitiesScreen(),
      //   );
      // },
    );
  }
}
