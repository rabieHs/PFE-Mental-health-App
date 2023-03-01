import 'dart:async';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/feed/widgets/shimmer_widget.dart';
import 'package:mental_health_app/quotes/models/quotes_model.dart';
import 'package:mental_health_app/quotes/screens/quotes_screen.dart';
import 'package:mental_health_app/quotes/widgets/shimmer_quote.dart';

class QuotesCard extends StatefulWidget {
  final List<Quotes> quotes;
  const QuotesCard({super.key, required this.quotes});

  @override
  State<QuotesCard> createState() => _QuotesCardState();
}

class _QuotesCardState extends State<QuotesCard> {
  int _currentInddex = 0;
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentInddex = (_currentInddex + 1) % widget.quotes.length;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuotesScreen(
                  quotList: widget.quotes, index: _currentInddex)));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 75,
          child: Stack(
            children: [
              ShimmerQuote(
                height: 75,
                widht: MediaQuery.of(context).size.width,
              ),
              Image.network(
                widget.quotes[_currentInddex].image,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                child: Center(
                  child: AutoSizeText(
                    widget.quotes[_currentInddex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
