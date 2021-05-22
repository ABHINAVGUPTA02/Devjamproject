import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/communities_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';
// import './models/post.dart';
import 'loading_page.dart';
import 'package:email_auth/email_auth.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void sendOTP() async {
    EmailAuth.sessionName = 'Test Session';
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if (res) {
      print('OTP Sent Successfully');
    } else {
      print('OTP Sending Failed');
    }
  }

  void verifyOTP() async {
    EmailAuth.sessionName = 'Test Session';
    var res = await EmailAuth.validate(
        receiverMail: _emailController.text, userOTP: _otpController.text);
    if (res) {
      print('OTP Verified');
    } else {
      print('Invalid OTP');
    }
  }

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  // List<Meal> _favoriteMeals;

  bool _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _isLogin, context);

      // ModalRoute()
      // Navigator.push(context, MaterialPageRoute(builder: (context) => TabsScreen(_favoriteMeals)));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoadingPage()),
        );
      });
      // CommunitiesScreen();
      // return CommunitiesScreen();

    }
    // else{
    //   return null;
    // }
  }


  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if(!_isLogin)
                  TextField(
                    key: ValueKey('email'),
                    // validator: (value) {
                    //   if (value.isEmpty || !value.contains('@')) {
                    //     return 'Please enter a valid email address.';
                    //   }
                    //   return null;
                    // },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "Email",
                      suffixIcon: TextButton(
                        child: Text('Send OTP'),
                        onPressed: () => sendOTP(),
                      ),
                    ),
                  ),
                  if(_isLogin)
                  TextField(
                    key: ValueKey('email'),
                    // validator: (value) {
                    //   if (value.isEmpty || !value.contains('@')) {
                    //     return 'Please enter a valid email address.';
                    //   }
                    //   return null;
                    // },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "Email",
                      ),
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Username'),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  if (!_isLogin)
                    TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        labelText: "OTP",
                      ),
                    ),
                  SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                      onPressed: () {
                        _trySubmit();
                      },
                      // onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => CommunitiesScreen())),
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
