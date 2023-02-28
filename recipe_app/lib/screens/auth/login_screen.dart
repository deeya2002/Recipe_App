import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../Services/local_notification_service.dart';
import '../../viewmodels/authe_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool password_view = false;
  final form = GlobalKey<FormState>();
  // void login() async {
  //   Connection con = new Connection();
  //   await con.dataCon();
  //   bool um = await con.verifyPass(email.text, password.text);
  //   debugPrint(um.toString());
  //   if(um){
  //    Navigator.of(context).pushNamed('/home');
  //   }
  // }
  // void login() async{
  //   _ui.loadState(true);
  //   try{
  //     _auth.login(email.text, password.text).then((value){
  //       Navigator.of(context).pushReplacementNamed('/dashboard');
  //     })
  //         .catchError((e){
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
  //     });
  //   }catch(err){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
  //   }
  //   _ui.loadState(false);
  // }
  void login() async {
    if (form.currentState == null || !form.currentState!.validate()) {
      return;
    }
    _ui.loadState(true);
    try {
      await _auth.login(email.text, password.text).then((value) {

        NotificationService.display(
          title: "Welcome back",
          body: "Hello ${_auth.loggedInUser?.name},\n Hope you are having a wonderful day.",
        );
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }

  late GlobalUIViewModel _ui;
  late AuthViewModel _auth;
  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white
          //  image: DecorationImage(
          // image: AssetImage('assets/images/login.png'), fit:BoxFit.cover)
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: 1000,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(5, 80, 5, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "RECIPE APP",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.fromLTRB(200, 0, 0, 0),
                  width: 200,
                  child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(236, 180, 118, 1)),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("/register");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Image.asset(
                  'assets/images/back_home.jpg',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: email,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+.com")
                                  .hasMatch(value)) {
                                return "Please enter valid email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: "Email",
                              // hintStyle: hintStyle()),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: password,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "password is required";
                            }
                            if (value.length < 6 || value.length > 10) {
                              return "enter password of 6 to 10 characters";
                            }
                            return null;
                          },
                          obscureText: !password_view,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            prefixIcon: Icon(Icons.key, color: Colors.black),
                            hintText: "Password",
                            // hintStyle: hintStyle(),

                            // showVisibilityIcon(password_view)),
                            // validator: Validators(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 236, 180, 118)),
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  splashColor: Colors.amber,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
