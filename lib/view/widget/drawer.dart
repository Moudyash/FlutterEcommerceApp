import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/Imageassets.dart';

class MyDrawer extends StatelessWidget {

  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: FutureBuilder(
                future: collectionReference
                    .where("uid",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                                child: Image.asset(ImageTable.user,
                                    fit: BoxFit.cover, width: 70, height: 70)),
                          ),
                        ),
                        Text("${snapshot.data!.docs.first["username"]}"),
                        Text("${snapshot.data!.docs.first["email"]}")

                      ],
                    );
                  } else {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                              child: Image.asset(ImageTable.user,
                                  fit: BoxFit.cover, width: 70, height: 70))),
                    );
                  }
                })),
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pushNamed("/home");

          },
        ),
        ListTile(
          title: Text("My Cart"),
          leading: Icon(Icons.shopping_cart),
          onTap: () {
            Navigator.of(context).pushNamed("/cart");
          },
        ),
        ListTile(
          title: Text("About"),
          leading: Icon(Icons.info_outline),
          onTap: () {
            Navigator.of(context).pushNamed("/about");
          },
        ),

        ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.power_settings_new),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/login", (route) => false);            // Navigator.of(context).pushNamed("/home");
          },
        ),

      ],
    );
  }
}
