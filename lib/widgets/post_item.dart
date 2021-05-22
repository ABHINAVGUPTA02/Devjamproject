
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:like_button/like_button.dart';

import '../screens/post_detail_screen.dart';
import '../models/post.dart';
import '../screens/comment_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    return 'comment';
    // switch (affordability) {
    //   case Affordability.Affordable:
    //     return 'First Year';
    //     break;
    //   case Affordability.Pricey:
    //     return 'Second Year';
    //     break;
    //   case Affordability.Luxurious:
    //     return 'Third Year';
    //     break;
    //   default:
    //     return 'Fourth Year';
    // }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });


  }

  // Future<void> share(dynamic link, String title) async{
  //   title: Text('Community Post');
  //   text: title;
  //   linkUrl:link;
  //  chooserTitle:Text('Where you want to share');
  // }
  int counter = 0;
  bool like=true;

  int like_counter(bool like){
    var color =  like? Colors.red:Colors.white;
    if(color == Colors.red){
      return counter+1;
    }
    else
      return 0;
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: title,
        text: imageUrl,
        linkUrl: imageUrl,
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // Icon(
                      //   Icons.forward_outlined,
                      // ),
                      new MaterialButton(
                         // 'Share',
                         child: Icon(Icons.share),
                        // onPressed: (){
                        //    // share(link[index],title[index]);
                        //    // share(link = Image.network(imageUrl),title:'Post01')
                        //
                        // },
                        onPressed:() => share(),
                        color: Colors.teal,
                        elevation: 0.0,

                      ),

                      SizedBox(
                        width: 6,
                      ),
                      // Text('$duration min'),
                      // Text('Share')
                    ],
                  ),
                  Row(
                    children: <Widget>[

                        // Icons.work,
                        LikeButton(
                          isLiked: like,
                          likeCount: like_counter(like),
                        ),


                      SizedBox(
                        width: 6,
                      ),
                      Text('like'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // Icon(
                      //   // Icons.attach_money,
                      //   Icons.comment_sharp,
                      // ),

                      new MaterialButton(
                        child:  Icon(Icons.chat_bubble_outline),
                            elevation: 0.0,
                            color:Colors.grey,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage())),
                      ),
                      // SizedBox(
                      //   width: 6,
                      // ),
                      // Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
