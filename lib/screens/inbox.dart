import 'package:flutter/material.dart';
import '../screens/chat_screen.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/tabsScreen'),
          color: Colors.black,
        ),
        title: Text(
            'Inbox',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen())),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                          ),
                        ]
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    padding: EdgeInsets.only(left:20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SCARVAGE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                              ),
                            ),
                            Text(
                              '12:20 pm',
                              style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height:10.0),
                        Container(
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Hey dude,Whats the plan? for today?Lets meet?We will go to our favorite hangout place and will have a lot of fun',
                              // _control.text,
                              overflow: TextOverflow.ellipsis,

                              maxLines:2,
                            ),
                          ),

                        ),
                      ],
                    ),
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
