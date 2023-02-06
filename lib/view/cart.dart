import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohammed/view/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:mohammed/view/widget/customboutton.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

FirebaseFirestore firestore =FirebaseFirestore.instance;
class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("My Cart",style: TextStyle(color: Colors.black,fontSize: 20,),)),
          iconTheme: const IconThemeData.fallback(),
          elevation: 0,
          backgroundColor:MyColors.backgroundAppBar,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: firestore.collection("cart")
                  .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Are you sure you want to delete this item?"),
                                    actions: <Widget>[
                                      CustomButton(
                                        onPressed: () => Navigator.of(context).pop(), text: 'Cancel', color: Colors.black,
                                      ),
                                      CustomButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          await firestore.collection("cart")
                                              .doc(snapshot.data!.docs[index].id)
                                              .delete();
                                          setState(() {});
                                        }, text: 'Delete', color: Colors.red,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.cancel_outlined),
                          ),                          title: Text(
                            "${snapshot.data!.docs[index]["name"]}",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                          subtitle: Text("\$ ${snapshot.data!.docs[index]["price"]}"),
                          leading: Image.asset(
                            "${snapshot.data!.docs[index]["image"]}",
                            width: 70,
                            height: 70,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child:CircularProgressIndicator()
                    ,
                  );
                }
              }
          ),
        ));
  }
}
