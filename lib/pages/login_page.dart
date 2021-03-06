import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/main.dart';
import 'package:jaisalmeria_handloom/models/responses/login_modal.dart';
import 'package:jaisalmeria_handloom/pages/home_page.dart';
import 'package:jaisalmeria_handloom/pages/sign_up.dart';
import 'package:jaisalmeria_handloom/services/api_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Future<LoginModal> _futureUser;
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: _emailId,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: _password,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            _futureUser = ApiManager.loginUser(_emailId.text, _password.text);
          });
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView (
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "assets/images/jh.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(height: 35.0),
                      loginButon,
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New to Jaisalmeria Handloom ?',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                future: _futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print('snapshot.data');
                    print(snapshot.data);
                    if(snapshot.data.statusCode == 0)
                      return successDialog(snapshot);
                    else 
                      return failureDialog();
                  } else if (snapshot.hasError) {
                    return failureDialog();
                  }
                  return Container(width: 0.0, height: 0.0); 
                },
              ),
            ],
          ),
        ),
      ) 
       
      
    );
  }

  successDialog(snapshot) {
    Future<LoginModal>.delayed(Duration.zero, () => 
      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyApp(user: snapshot.data)))
      // Navigator.of(context).pushNamed('/home',  arguments: {"user": snapshot.data})
    );
                  
    
    // Future<Response>.delayed(Duration.zero, () => showDialog(
    //     context: context,
    //     // ignore: deprecated_member_use
    //     child: AlertDialog(
    //       shape: RoundedRectangleBorder(
    //           borderRadius:
    //               BorderRadius.all(Radius.circular(16.0))),
    //       content: Container(
    //         height:
    //             MediaQuery.of(context).size.height / 1.8,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Icon(
    //               Icons.check_circle_outline,
    //               size: 96,
    //               color: Color(0xFF10CA88),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   vertical: 16.0),
    //               child: Text(
    //                 "Login Success",
    //                 style: TextStyle(fontSize: 20),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  failureDialog() {
    Future<LoginModal>.delayed(Duration.zero, () => showDialog(
        context: context,
        // ignore: deprecated_member_use
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(16.0))),
          content: Container(
            height:
                MediaQuery.of(context).size.height / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.exclamationmark_square,
                  size: 96,
                  color: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0),
                  child: Text(
                    "Login Failed",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}