import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:posapp/db/users.dart';
import 'package:posapp/pages/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmpasswordTextController =
      TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  String gender;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.purple),
        elevation: 0.1,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                                hintText: "Full Name",
                                icon: Icon(Icons.person),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'The Name field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.email),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+9\.[^<>()[\]\\.,;:\s@\"]+)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))S';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Please make sure your email address is valid';
                                else
                                  return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _passwordTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'The password field cannot be empty';
                              } else if (value.length < 6) {
                                return 'The password has to be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _confirmpasswordTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Confirm Password",
                                icon: Icon(Icons.lock),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'The password field cannot be empty';
                              } else if (value.length < 6) {
                                return 'The password has to be at least 6 characters long';
                              } else if (_passwordTextController.text !=
                                  value) {
                                return 'The password and not match';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                        elevation: 0.0,
                        child: MaterialButton(onPressed: () async {validateForm();},
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(10),
//                      child: InkWell(
//                        onTap: () {
//                          Navigator.pop(context);
//                        },
//                        child: Text(
//                          "Login",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(color: Colors.purple),
//                        ),
//                      ),

//                      RichText(
//                        text: TextSpan(
//                          style: TextStyle(
//                            color: Colors.black54,
//                            fontWeight: FontWeight.w500,
//                          ),
//                          children: [
//                            TextSpan(
//                                text: "Don't have an accout? click here to "),
//                            TextSpan(
//                              text: "sign up!",
//                              style: TextStyle(color: Colors.purple),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      print(user == null);
      if (user == null) {
        print(null);
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then(
              (result) => {
                print(result.user.uid),
                _userServices.createUser(
                  {
                    "username": _nameTextController.text,
                    "email": _nameTextController.text,
                    "userId": result.user.uid,
                  },
                ),
              },
            );
//            .catchError((err) => {print(err.toString())})) as FirebaseUser;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }
}
