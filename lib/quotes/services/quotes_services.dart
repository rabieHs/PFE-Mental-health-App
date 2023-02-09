import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/quotes/models/quotes_model.dart';

import '../../auth/services/auth_services.dart';

class QuotesServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Quotes>> getQuotes() async {
    final mood = await AuthServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid);
    print("quotes $mood");
    List<Quotes> quotes = [];
    QuerySnapshot snapshot = await firestore
        .collection(mood)
        .doc("Quotes")
        .collection("Quotes")
        .get();
    print(snapshot.docs.length);
    quotes = snapshot.docs.map((d) {
      final data = d.data() as Map<String, dynamic>;
      return Quotes.fromMap(data);
    }).toList();
    return quotes;
  }

  getquotesScreens(List<Quotes> quotes, BuildContext context) {
    List<Widget> screens = [];
    quotes.forEach((quote) {
      screens.add(Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(quote.image), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      quote.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      quote.author,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )));
    });
    return screens;
  }
}
