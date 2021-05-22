import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/post_item.dart';
import '../services/crud.dart';
import '../screens/creat_blog.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_share/flutter_share.dart';
import 'comment_page.dart';
import '../models/post.dart';
import 'post_detail_screen.dart';
import 'package:flutter_complete_guide/dummy_data.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  CrudMethods crudMethods = new CrudMethods();

  Stream blogsStream;

  Widget BlogsList() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: blogsStream != null
          ? StreamBuilder<QuerySnapshot>(
        stream: blogsStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                /* return Text(snapshot.data.docs[0]['authorName']); */
                return BlogsTile(
                  authorName: snapshot.data.docs[index]['authorName'],
                  title: snapshot.data.docs[index]["title"],
                  description: snapshot.data.docs[index]['desc'],
                  imgUrl: snapshot.data.docs[index]['imageUrl'],
                );
              });
        },
      )
          : Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    /* crudMethods.getData().then((result) {
      setState(() {
        blogsStream = result;
      });
    }); */
    super.initState();
    blogsStream = crudMethods.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Posting to the",
              style: TextStyle(fontSize: 22,color: Colors.black),
            ),
            Text(
              " Community",
              style: TextStyle(fontSize: 22, color: Colors.blue[900]),
            )
          ],
        ),
        backgroundColor: Colors.pink,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => Navigator.pushReplacementNamed(context, '/tabsScreen'),
          color: Colors.black,
        ),
      ),
      body: BlogsList(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  // final String title ='' ;
  // final String imageUrl ='';
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
        text: imgUrl,
        linkUrl: imgUrl,
        chooserTitle: 'Example Chooser Title');
  }

  String imgUrl, title, description, authorName;
  BlogsTile(
      {@required this.imgUrl,
        @required this.title,
        @required this.description,
        @required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 250,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                    authorName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(top: 100.0),
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                      // Icons.work,
                      LikeButton(
                        isLiked: like,
                        likeCount: like_counter(like),
                      ),

                      Text('like',style: TextStyle(
                        color: Colors.white,
                      ),),
                      SizedBox(width: 6.0),
                      new MaterialButton(
                        child:  Icon(Icons.chat_bubble_outline),
                        elevation: 0.0,
                        color:Colors.grey,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage())),
                      ),
                    ],
                  ),
                ),
                ],
          ),
          ),
        ],

      ),
    );
  }
}
