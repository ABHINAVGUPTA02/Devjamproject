import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_complete_guide/screens/post_upload_screen.dart';

import '../widgets/post_item.dart';
import '../models/post.dart';
import '../screens/inbox.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String communityTitle;
  List<Meal> displayedPosts;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      communityTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedPosts = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedPosts.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
            communityTitle,
           style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
           ),
        ),
        actions:[
          IconButton(
            icon: Icon(Icons.chat_bubble_rounded),
            // iconSize: 4.0,
            // icon: new Image.asset('/assets/chat.png'),
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Inbox())),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return MealItem(
                        id: displayedPosts[index].id,
                        title: displayedPosts[index].title,
                        imageUrl: displayedPosts[index].imageUrl,
                        duration: displayedPosts[index].duration,
                        affordability: displayedPosts[index].affordability,
                        complexity: displayedPosts[index].complexity,
                      );
                    },
                    itemCount: displayedPosts.length,
                  ),
          ),


       Container(
         margin: EdgeInsets.only(bottom: 5.0),
         child: new MaterialButton(

           padding: EdgeInsets.all(16.0),
            color: Colors.pink,
             onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage())),
             child: Icon(
                 Icons.add,
                 color: Colors.black,
               size: 24.0,
             ),
           shape: CircleBorder(),
           elevation: 10.0,
         ),
       ),


    ],
      ),
    );
  }
}
