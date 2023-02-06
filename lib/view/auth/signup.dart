import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/customboutton.dart';
import '../widget/customtextfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
late TextEditingController username;
late TextEditingController uemail;
late TextEditingController upassword;

class _SignUpState extends State<SignUp> {
  @override
  void initState() {

    username=TextEditingController();
    uemail=TextEditingController();
    upassword=TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(top: 70),
            children: [
              const Text(
                "New Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      CustomField(
                        valid: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;                             },
                        title: "User Name",
                        icon: Icons.person
                          ,

                        iconsuff: Icons.person,
                        mycontroller: username,

                      ),
                      CustomField(
                        valid: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;                             },
                        onsaved: (val) {
                          val = uemail.text.trim();
                        },
                        title: "Email",
                        iconsuff: Icons.email,
                        mycontroller: uemail,
                        icon: Icons.alternate_email,
                      ),
                      CustomField(
                        valid: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;                             },
                        onsaved: (val) {
                          val = upassword.text.trim();
                        },
                        obscuertext: true,

                        icon: Icons.lock,
                        title: "Password",
                        iconsuff: Icons.lock,
                        mycontroller: upassword,
                      ),

                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: "Create",
                        color: Colors.blue,
                        onPressed: () async {

                            UserCredential credential;
                            var formdata = globalKey.currentState;
                            if (formdata!.validate()) {
                              formdata.save();
                              try {
                                Dialog(child: CircularProgressIndicator(),);
                                credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: uemail.text.trim(), password: upassword.text.trim());
                                if (credential != null) {
                                  await FirebaseFirestore.instance.collection("users").add({
                                    "username": username.text.trim(),
                                    "email": uemail.text.trim(),
                                    "uid":FirebaseAuth.instance.currentUser!.uid
                                  });
                                  Navigator.of(context).pushNamed("/login");
                                }
                              } on FirebaseAuthException catch (e) {
                                if (e.code == "weak password") {
                                  print('The password weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print('The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }

                              print("Validate");
                            } else {
                              print("Validate");
                            }


                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "you have an account",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/login");

                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
