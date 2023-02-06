import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About App"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Image.asset(
                "assets/images/forget.png",
                height: 120,
                width: 120,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "ecommerce ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "About the App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "This app is a comprehensive and user-friendly platform that helps users manage various aspects of their lives with ease. The app boasts a sleek and modern design that provides an intuitive interface for users to navigate and interact with its features. Whether you are looking to keep track of your daily tasks, manage your shopping cart, or stay on top of your health and wellness, this app has you covered. With its integration with the latest technology, such as Firebase, the app offers robust and secure functionalities that cater to all your needs. Whether you are a busy professional or a stay-at-home parent"
                    ,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
