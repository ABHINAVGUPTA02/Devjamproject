import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(MaterialApp(
      home: Profile(),
    ));

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String imageLink;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

  }

  Future uploadImage(File _image1) async {
    String fileName = basename(_image.path);
    // StorageReference firebaseStorageRef = firebaseStorage.instance.ref().child(fileName);
    FirebaseStorage storage = FirebaseStorage.instance;
    String url;
    Reference ref = storage.ref().child("image1" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_image1);
    // TaskSnapshot taskSnapshot = await uploadTask.onComplete;
    uploadTask.then((res) {
      res.ref.getDownloadURL();
    }).catchError((onError) {
      print(onError);
    });
    setState(() {
      // FirebaseFirestore.instance.collection('AXcNySzPor8Z5h0B1FCZ').doc(_auth.uid);
      CollectionReference image = FirebaseFirestore.instance.collection('profilephoto');

      Future<void> addUser() {
        // Call the user's CollectionReference to add a new user
        return image
            .add({
          'image' : _image,// 42
        })
            .then((value) => print("image Added"))
            .catchError((error) => print("Failed to add image: $error"));
      }
      print('Profile Photo updated');
      // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Photo Updated!')));
    });
    return url;
  }
  //
  // // @override
  // // Widget build(BuildContext context) {
  // //   // TODO: implement build
  // //   throw UnimplementedError();
  // // }
  //
  // // var _userEmail = '';
  // // var _userName = '';
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed('/tabsScreen'),
        ),
        title: Text(
          'Account',
          style: TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.pink,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.0,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 65,
                      child: ClipOval(
                        child: SizedBox(
                          width: 120.0,
                          height: 120.0,
                          child: (_image != null) ? Image.network(
                            _image.toString(), fit: BoxFit.fill,) : Image.network(
                            "https://cdn4.iconfinder.com/data/icons/animal-2-1/100/animal-15-512.png", fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: IconButton(
                      iconSize: 25.0,
                      icon: Icon(Icons.camera),
                      color: Colors.black,
                      onPressed: () => getImage(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 85.0,
              color: Colors.black,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'UserName',
                          style: TextStyle(
                            color: Colors.black54,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          'AGLUCIFER',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Date of Birth',
                          style: TextStyle(
                            color: Colors.black54,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          '30 Jan 2002',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'location',
                          style: TextStyle(
                            color: Colors.black54,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          'Delhi,India',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Center(
                    child: Text(
                      'abhinav.gupta.ag47@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.pink,
                  ),
                  new MaterialButton(
                    onPressed: () => uploadImage(_image),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.pink,
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

