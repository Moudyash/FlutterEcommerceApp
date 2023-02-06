
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util/Imageassets.dart';
import '../util/colors.dart';
import '../widget/customboutton.dart';
import '../widget/customtextfield.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

late TextEditingController email;
late TextEditingController password;

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();

    return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(top: 50),
            children: [
              Image.asset(
                ImageAssets.loginPhoto,
                alignment: Alignment.center,
                height: 200,
                width: 200,
              ),
              const Text("Welcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.black)),
              const Text(
                "Log in your account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: MyColors.secondary),
              ),
              Form(
                key: globalKey,
                child: Column(
                  children: [
                    CustomField(
                      iconsuff: Icons.email,
                      title: "Email",
                      mycontroller: email,
                      valid: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;                      },
                    ),
                    CustomField(
                        obscuertext: true,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        iconsuff: Icons.lock,
                                         title: "Password",
                        mycontroller: password,
                      ),
                    CustomButton (
                      text: "Login",
                      color: MyColors.blue,
                      onPressed: ()async {
                        var formdata = globalKey.currentState;
                        if (formdata!.validate()) {
                          formdata.save();
                          try {
                            UserCredential credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: email.text.trim(), password: password.text.trim());

                            if (credential != null) {
                              Navigator.of(context).pushNamed("/home");
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print("****************user-not-found");
                            } else if (e.code == 'wrong-password') {
                              print("***********wrong-password");
                            }
                          }
                          print("  valid");
                        } else {
                          print("not valid");
                        }

                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Or login with",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create a new account",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/signup");
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
