import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _control = new TextEditingController(text: ' ');

  List<String> _messages = [];

  void _addMessage (String val){
    setState(() {
      _messages.add(val);
    });
  }

  Widget _buildMessageItem(String message){
    return ListTile(
      title: Text(message),
    );
  }

  Widget _buildMessageList(){
    return ListView.builder(
        itemBuilder: (context,index){
          if(index < _messages.length){
            return _buildMessageItem(_messages[index]);
          }
        }
    );
  }

  void _submitButton(String m){
    _control.clear();
    _addMessage(m);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: [
                TextSpan(
                  text:'Scarvage \n',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:'online',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ]
          ),
        ),
        leading: IconButton(
          // color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      // body: Column(
      //   children: [
      // Expanded(
      //   child: Column(
      //     children: [
      //       Container(
      //         alignment: Alignment.topLeft,
      //         constraints: BoxConstraints(
      //           maxWidth: MediaQuery.of(context).size.width*0.80,
      //         ),
      //         child: Container(
      //           // height:20.0,// depends on the message
      //           // width: MediaQuery.of(context).size.width* 0.65,//depends on the message
      //           child: Text('Data Hey How you Doing lallalalaal akalala jflkdjakl fdsfsdl'),
      //           padding: EdgeInsets.all(10.0),
      //           margin: EdgeInsets.symmetric(vertical: 10.0),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(15.0),
      //             boxShadow:   [
      //               BoxShadow(
      //                 color: Colors.grey.withOpacity(0.5),
      //                 spreadRadius: 2.0,
      //                 blurRadius: 5.0,
      //               ),
      //             ]
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child:Column(
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             Container(
      //               alignment: Alignment.topRight,
      //               constraints: BoxConstraints(
      //                 maxWidth: MediaQuery.of(context).size.width*0.80,
      //               ),
      //               child: Container(
      //                 alignment: Alignment.topRight,
      //                 // height:20.0,// depends on the message
      //                 // width: MediaQuery.of(context).size.width* 0.65,//depends on the message
      //                 child: Text('Data Hey How yasd asd sakjdhsaj dskajhdjksah dkjsaalaal akalala jflkdjakl fdsfsdl'),
      //                 padding: EdgeInsets.all(10.0),
      //                 margin: EdgeInsets.symmetric(vertical: 10.0),
      //                 decoration: BoxDecoration(
      //                     color: Colors.lightGreen,
      //                     borderRadius: BorderRadius.circular(15.0),
      //                     boxShadow:   [
      //                       BoxShadow(
      //                         color: Colors.grey.withOpacity(0.5),
      //                         spreadRadius: 2.0,
      //                         blurRadius: 5.0,
      //                       ),
      //                     ]
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               child: Text('data'),
      //             ),
      //             Container(
      //               child: Text('data'),
      //             ),
      //             Container(
      //               child: Text('data'),
      //             ),
      //             Container(
      //               child: Text('data'),
      //             ),
      //             Container(
      //               child: Text('data'),
      //             ),
      //           ],
      //         ),
      //
      //       ),
      //       Container(
      //         child: Text('data'),
      //       ),
      //       Container(
      //         child: Text('data'),
      //       ),
      //       Container(
      //         child: Text('data'),
      //       ),
      //       Container(
      //         child: Text('data'),
      //       ),
      //       Container(
      //         child: Text('data'),
      //       ),
      //     ],
      //   ),
      //
      //
      //
      // ),
      //
      //
      //     Container(
      //       padding: EdgeInsets.all(10.0),
      //       child: Text('send a message '),
      //     ),
      //     ]
      // ),
      body:new Column(
        children:[
          Expanded(
            child: _buildMessageList(),
          ),
          Column(
            children: [
              Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new TextField(
                      controller: _control,
                      onSubmitted: (String messageStr){
                        _control.clear();
                        _addMessage(messageStr);
                      },
                      decoration: InputDecoration(
                        hintText: 'send a message',
                        hintStyle: TextStyle(
                          color: Colors.pink,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color:Colors.pink, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () => _submitButton(_control.text),
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
