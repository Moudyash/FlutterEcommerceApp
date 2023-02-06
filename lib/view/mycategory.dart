import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohammed/view/cart.dart';
import 'package:mohammed/view/widget/customboutton.dart';

import '../controller/logic/uploaddata.dart';
import '../model/categoryItem.dart';

class MyCategory extends StatefulWidget {
  MyCategory({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel  categoryModel;

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  Color circleColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF035AA6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF1EFF1),
          leading: IconButton(
              padding: EdgeInsets.all(30),
              icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.pop(context);
          },color: Colors.black),
          actions: [
            IconButton(
                padding: EdgeInsets.all(30),
                icon: Icon(Icons.shopping_cart),onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()),);
            },color: Colors.black),

          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                // height:700,
                decoration: const BoxDecoration(
                    color: Color(0xFFF1EFF1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onDoubleTap: () {
                          setState(() {
                            circleColor = Color.fromARGB(
                              255,
                              Random().nextInt(256),
                              Random().nextInt(256),
                              Random().nextInt(256),
                            );
                          });
                        },
                child: Center(

                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                height: 250,
                                width: 250,
                                decoration:  BoxDecoration(
                                    color: circleColor,
                                    borderRadius: BorderRadius.all(Radius.circular(150))),
                              ),
                              Image.asset(
                                "${widget.categoryModel.image}",
                                width: 270,
                                height: 270,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("${widget.categoryModel.name}",style: const TextStyle(fontSize: 18),),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "\$${"${widget.categoryModel.price}"}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all( 15),
                        child: Text("${widget.categoryModel.description}",
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 14,
                            )),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  text: "Add To Cart",
                  color: Colors.amberAccent,
                  onPressed: () {
                    collectionReference.add({
                      'name':widget.categoryModel.name,
                      'image':widget.categoryModel.image,
                      'price':widget.categoryModel.price,
                      "uid":
                      FirebaseAuth.instance.currentUser!.uid
                    });
                  })
            ],
          ),
        ));
  }
}

