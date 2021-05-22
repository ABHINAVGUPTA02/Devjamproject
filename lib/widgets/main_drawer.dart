import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'FEED',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Community', Icons.account_balance_outlined, () {
            Navigator.of(context).pushReplacementNamed('/tabsScreen');
          }),
          // buildListTile('Filters', Icons.settings, () {
          //   Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          // }),
          buildListTile('Chats', Icons.chat_bubble_rounded, () {
            Navigator.of(context).pushReplacementNamed('/inbox');
          }),
          buildListTile('Account', Icons.account_circle, () {
            Navigator.of(context).pushReplacementNamed('/profile');
          }),
        ],
      ),
    );
  }
}
