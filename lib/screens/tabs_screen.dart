import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/auth_screen.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './communities_screen.dart';
import '../models/post.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CommunitiesScreen(),
        'title': 'Communities',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon:Icon(Icons.menu),
        //     color: Colors.black ,
        //   onPressed: () => MainDrawer(),
        // ),

        title: Text(
            _pages[_selectedPageIndex]['title'],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
          icon: Icon(Icons.logout),
           onPressed: () =>  WidgetsBinding.instance.addPostFrameCallback((_) {
             Navigator.pushReplacementNamed(context, '/authentication');
           },
           ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body:_pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Communities'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// import '../widgets/main_drawer.dart';
// import './favorites_screen.dart';
// import './communities_screen.dart';
// import '../models/post.dart';
// import '../models/community.dart';
//
// class TabsScreen extends StatefulWidget {
//   final List<Meal> favoriteMeals;
//
//   TabsScreen(this.favoriteMeals);
//
//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }
//
// class _TabsScreenState extends State<TabsScreen> {
//   List<Map<String, Object>> _pages;
//   int _selectedPageIndex = 0;
//
//   @override
//   void initState() {
//     _pages = [
//       {
//         'page': CategoriesScreen(),
//         'title': 'Categories',
//       },
//       {
//         'page': FavoritesScreen(widget.favoriteMeals),
//         'title': 'Your Favorite',
//       },
//     ];
//     super.initState();
//   }
//
//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_pages[_selectedPageIndex]['title']),
//       ),
//       drawer: MainDrawer(),
//       body: _pages[_selectedPageIndex]['page'],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Theme.of(context).accentColor,
//         currentIndex: _selectedPageIndex,
//         // type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Icon(Icons.category),
//             title: Text('Categories'),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Icon(Icons.star),
//             title: Text('Favorites'),
//           ),
//         ],
//       ),
//     );
//   }
// }
