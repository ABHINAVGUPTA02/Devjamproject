import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  var _controller = new TextEditingController(text:'');
  List<String> _comments = [];

  void _addComments(String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(
      title: Text(comment),
    );
  }

  Widget _buildCommentList() {
    return ListView.builder(
        itemBuilder: (context, index) {
      if (index < _comments.length) {
        return _buildCommentItem(_comments[index]);
      }
    });
  }

  void _submitComment(){
    _addComments(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: _buildCommentList(),
        ),
            new TextField(
              controller: _controller,
              autocorrect: true,
              onSubmitted: (String commentsStr) {
                _addComments(commentsStr);
                _controller.clear();
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                hintText: "add a comment",
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.pink,width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.pink)
                ),
                suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _submitComment(),
                ),
              ),
              
            ),
            // new MaterialButton(
            //   onPressed: () {
            //     (String commentsStr) {
            //       _addComments(commentsStr);
            //     };
            //   },
            //   child: Icon(Icons.send),
            // )
      ]),
    );
  }
}
