import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void routingBetweenpages() async {
     await WidgetsBinding.instance.addPostFrameCallback((_) {
       Navigator.pushReplacementNamed(context, '/tabsScreen');
     });
  }
  @override
  void initState(){
    super.initState();
    routingBetweenpages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
