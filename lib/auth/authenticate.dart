import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:ghana_tour/pages/home.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticatState createState() => _AuthenticatState();
}

SharedPreferences appStorage;

class _AuthenticatState extends State<Authenticate> {
  String email;
  String password;
  String email2;
  String password2;
  String firstName;
  String lastName;
  String country;
  bool loading = false;
  bool loading2 = false;

  bool hidePassword = true;
  bool hidePassword2 = true;

  Map registerResponse;

  Map loginResponse;

  bool error = false;
  String errorMessage = '';

  _saveToken(
      String token, String firstName, String lastName, String email) async {
    appStorage = await SharedPreferences.getInstance();
    appStorage.setString("token", token);
    appStorage.setString("firstName", firstName);
    appStorage.setString("lastName", lastName);
    appStorage.setString("email", email);
  }

  Future login(Map data) async {
    try {
      await http
          .post("https://ghana-tour-server.herokuapp.com/api/login", body: data)
          .then((response) {
        if (response.statusCode == 200) {
          final _decodedResponse = json.decode(response.body);
          final _token = _decodedResponse["access_token"];
          final _firstName = _decodedResponse["first_name"];
          final _lastName = _decodedResponse["last_name"];
          final _email = _decodedResponse["email"];
          _saveToken(_email, _firstName, _lastName, _token);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

          setState(() {});
        } else {
          print("Login failed");
          setState(() {
            loading2 = !loading2;
          });
        }
      });
    } catch (e) {
      print("Login failed");
      print(e);
      setState(() {
        loading2 = !loading2;
      });
    }
  }

  Future register(Map data) async {
    try {
      await http
          .post("https://ghana-tour-server.herokuapp.com/api/register",
              body: data)
          .then((response) {
        if (response.statusCode == 201) {
          final _decodedResponse = json.decode(response.body);
          final _token = _decodedResponse["access_token"];
          final _firstName = _decodedResponse["first_name"];
          final _lastName = _decodedResponse["last_name"];
          final _email = _decodedResponse["email"];
          _saveToken(_email, _firstName, _lastName, _token);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

          setState(() {});
        } else {
          print("Registration failed");
          setState(() {
            loading = !loading;
          });
        }
      });
    } catch (e) {
      print("Registration failed");
      print(e);
      setState(() {
        loading = !loading;
      });
    }
  }

  void togglePassowordVisibilty() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  void togglePassowordVisibilty2() {
    setState(() {
      hidePassword2 = !hidePassword2;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  Widget buildEmail() {
    return TextFormField(
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15.0),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          labelText: "Email",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          prefixIcon: Icon(
            Icons.email,
            size: 15,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return "Email is Required";
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return "Enter a valid Email";
        }
        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget buildEmail2() {
    return TextFormField(
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15.0),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          labelText: "Email",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          prefixIcon: Icon(
            Icons.email,
            size: 15,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return "Email is Required";
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return "Enter a valid Email";
        }
        return null;
      },
      onSaved: (String value) {
        email2 = value;
      },
    );
  }

  Widget buildFirstName() {
    return TextFormField(
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15.0),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          labelText: "First name",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          prefixIcon: Icon(
            Icons.person,
            size: 15,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return "First name is Required";
        }
        if (!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$")
            .hasMatch(value)) {
          return "Enter a valid name";
        }
        return null;
      },
      onSaved: (String value) {
        firstName = value;
      },
    );
  }

  Widget buildLastName() {
    return TextFormField(
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15.0),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          labelText: "Last name",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red[400])),
          prefixIcon: Icon(
            Icons.person,
            size: 15,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return "Last name is Required";
        }
        if (!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$")
            .hasMatch(value)) {
          return "Enter a valid name";
        }
        return null;
      },
      onSaved: (String value) {
        lastName = value;
      },
    );
  }

  Widget buildPassword() {
    return TextFormField(
      obscureText: hidePassword ? true : false,
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15.0),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          labelText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          prefixIcon: Icon(
            Icons.lock,
            size: 15,
          ),
          suffixIcon: hidePassword
              ? IconButton(
                  onPressed: togglePassowordVisibilty,
                  icon: Icon(
                    Icons.visibility_off,
                    size: 15,
                  ),
                )
              : IconButton(
                  onPressed: togglePassowordVisibilty,
                  icon: Icon(
                    Icons.visibility,
                    size: 15,
                  ),
                )),
      validator: (String value) {
        if (value.isEmpty) {
          return "Password is Required";
        }
        if (!RegExp(r"^.{8,40}$").hasMatch(value)) {
          return "Minimum 8 characters";
        }
        return null;
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget buildPassword2() {
    return TextFormField(
      obscureText: hidePassword2 ? true : false,
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15.0),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          labelText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey[400])),
          prefixIcon: Icon(
            Icons.lock,
            size: 15,
          ),
          suffixIcon: hidePassword2
              ? IconButton(
                  onPressed: togglePassowordVisibilty2,
                  icon: Icon(
                    Icons.visibility_off,
                    size: 15,
                  ),
                )
              : IconButton(
                  onPressed: togglePassowordVisibilty2,
                  icon: Icon(
                    Icons.visibility,
                    size: 15,
                  ),
                )),
      validator: (String value) {
        if (value.isEmpty) {
          return "Password is Required";
        }
        if (!RegExp(r"^.{8,40}$").hasMatch(value)) {
          return "Minimum 8 characters";
        }
        return null;
      },
      onSaved: (String value) {
        password2 = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                elevation: 1.0,
                shadowColor: Colors.green[400],
                backgroundColor: Colors.white,
                bottom: TabBar(
                  labelColor: Colors.green[700],
                  tabs: [
                    Tab(
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    Tab(
                      child: Text("Register",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    )
                  ],
                  indicatorColor: Colors.green[600],
                ),
              ),
              preferredSize: Size.fromHeight(60.0)),
          body: TabBarView(children: <Widget>[
            SafeArea(
                child: loading2
                    ? Center(
                        child: JumpingDotsProgressIndicator(
                          fontSize: 120.0,
                          color: Colors.green[600],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 250,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: GoogleSignInButton(
                                      onPressed: () => {},
                                      darkMode: false,
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Or",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: <Widget>[
                                    Container(child: buildEmail()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(child: buildPassword()),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      width: width,
                                      height: 45.0,
                                      child: FlatButton(
                                        color: Colors.green[600],
                                        onPressed: () {
                                          if (!formKey.currentState
                                              .validate()) {
                                            return;
                                          }
                                          formKey.currentState.save();
                                          setState(() {
                                            loading2 = !loading2;
                                          });
                                          Map log = {
                                            "email": email,
                                            "password": password,
                                          };
                                          login(log);
                                        },
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("forgot password?",
                                              style: TextStyle(
                                                  color: Colors.green[600]))
                                        ])
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            SafeArea(
                child: loading
                    ? Center(
                        child: JumpingDotsProgressIndicator(
                          fontSize: 120.0,
                          color: Colors.green[600],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Form(
                                key: formKey2,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Container(
                                          child: buildFirstName(),
                                          width: 150,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Container(
                                          child: buildLastName(),
                                          width: 150,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(child: buildEmail2()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(child: buildPassword2()),
                                    SizedBox(
                                      height: 200.0,
                                    ),
                                    Container(
                                      width: width,
                                      height: 45.0,
                                      child: FlatButton(
                                        color: Colors.green[600],
                                        onPressed: () {
                                          if (!formKey2.currentState
                                              .validate()) {
                                            return;
                                          }
                                          formKey2.currentState.save();
                                          setState(() {
                                            loading = !loading;
                                          });
                                          Map body = {
                                            "email": email2,
                                            "password": password2,
                                            "first_name": firstName,
                                            "last_name": lastName
                                          };
                                          register(body);
                                        },
                                        child: Text(
                                          "Create Account",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
          ]),
        ));
  }
}
