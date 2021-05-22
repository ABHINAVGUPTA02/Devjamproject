import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/post_upload_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../services/crud.dart';
import 'package:random_string/random_string.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;

  File selectedImage;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();
  final picker = ImagePicker();
  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image.path);
    });
  }

  uploadBlog() async {
    if (selectedImage != null) {
      setState(() {
        _isLoading = true;
      });
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('blogImages')
          .child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = firebaseStorageRef.putFile(selectedImage);

      var downloadUrl = await (await task).ref.getDownloadURL();
      print('this is url $downloadUrl');
      Map<String, String> blogMap = {
        'imageUrl': downloadUrl,
        'authorName': authorName,
        'title': title,
        "desc": desc
      };
      crudMethods.addData(blogMap).then((result) {
        Navigator.pop(context);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Community',
              style: TextStyle(fontSize: 22,color:Colors.black),
            ),
            // Text(
            //   'Blog',
            //   style: TextStyle(fontSize: 22, color: Colors.blue),
            // )
          ],
        ),
        backgroundColor: Colors.pink,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              uploadBlog();
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload,color: Colors.black,)),
          )
        ],
      ),
      body: _isLoading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage != null
                  ? Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.file(
                    selectedImage,
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  : Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  width: MediaQuery.of(context).size.width,
                  child:
                  Icon(Icons.add_a_photo, color: Colors.black45)),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Author Name'),
                    onChanged: (val) {
                      authorName = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Title'),
                    onChanged: (val) {
                      title = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Desc'),
                    onChanged: (val) {
                      desc = val;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
